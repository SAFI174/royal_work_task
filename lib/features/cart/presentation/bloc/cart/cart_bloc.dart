import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_task/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:royal_task/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:royal_task/features/products/domain/entities/product.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/cart_item.dart';
import '../../../domain/usecases/save_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  // Use cases for managing cart items
  final GetCartItemsUsecase _getCartItemsUsecase;
  final ClearCartUsecase _clearCartUsecase;
  final SaveCartUsecase _saveCartUsecase;

  // Constructor initializes use cases and sets initial state
  CartBloc(
    this._getCartItemsUsecase,
    this._clearCartUsecase,
    this._saveCartUsecase,
  ) : super(const CartState.initial()) {
    // Event handlers
    on<_GetCartItems>(_getCartItems);
    on<_AddToCart>(_addToCart);
    on<_ClearCart>(_clearCart);
    on<_RemoveFromCart>(_removeFromCart);
  }

  // Handler for fetching cart items
  FutureOr<void> _getCartItems(
      _GetCartItems event, Emitter<CartState> emit) async {
    emit(const CartState.loading()); // Emit loading state
    final result = await _getCartItemsUsecase(NoParams()); // Fetch cart items
    result.fold(
      (error) {
        emit(CartState.error(message: error.message)); // Emit error state
      },
      (cartItems) {
        emit(CartState.loaded(cartItems: cartItems)); // Emit loaded state
      },
    );
  }

  // Handler for adding a product to the cart
  FutureOr<void> _addToCart(_AddToCart event, Emitter<CartState> emit) async {
    state.whenOrNull(
      loaded: (cartItems) async {
        // Check if the product is already in the cart
        if (!cartItems.any(
          (element) => element.productId == event.product.id,
        )) {
          // Create a new cart item
          final newCartItems = [
            ...cartItems,
            CartItem(
              productId: event.product.id,
              title: event.product.title,
              price: event.product.price,
              quantity: 1,
              image: event.product.images.first,
            )
          ];

          final result =
              await _saveCartUsecase(newCartItems); // Save updated cart
          result.fold(
            (error) {
              emit(CartState.error(message: error.message)); // Emit error state
            },
            (cartItems) {
              emit(CartState.loaded(
                  cartItems: newCartItems)); // Emit loaded state
            },
          );
        }
      },
    );
  }

  // Handler for clearing all items in the cart
  FutureOr<void> _clearCart(_ClearCart event, Emitter<CartState> emit) async {
    final result = await _clearCartUsecase.call(NoParams()); // Clear cart
    result.fold(
      (error) {
        emit(CartState.error(message: error.message)); // Emit error state
      },
      (cartItems) {
        emit(const CartState.loaded(
            cartItems: [])); // Emit loaded state with empty cart
      },
    );
  }

  // Handler for removing a specific product from the cart
  FutureOr<void> _removeFromCart(
      _RemoveFromCart event, Emitter<CartState> emit) async {
    state.whenOrNull(
      loaded: (cartItems) async {
        // Remove the specified product
        final newCartItems = [
          ...cartItems.where((element) => element.productId != event.productId)
        ];
        final result =
            await _saveCartUsecase(newCartItems); // Save updated cart
        result.fold(
          (error) {
            emit(CartState.error(message: error.message)); // Emit error state
          },
          (cartItems) {
            emit(
                CartState.loaded(cartItems: newCartItems)); // Emit loaded state
          },
        );
      },
    );
  }
}
