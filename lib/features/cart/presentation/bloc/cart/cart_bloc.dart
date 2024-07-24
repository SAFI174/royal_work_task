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
  final GetCartItemsUsecase _getCartItemsUsecase;
  final ClearCartUsecase _clearCartUsecase;
  final SaveCartUsecase _saveCartUsecase;
  CartBloc(
    this._getCartItemsUsecase,
    this._clearCartUsecase,
    this._saveCartUsecase,
  ) : super(const CartState.initial()) {
    on<_GetCartItems>(_getCartItems);
    on<_AddToCart>(_addToCart);
    on<_ClearCart>(_clearCart);
    on<_RemoveFromCart>(_removeFromCart);
  }

  FutureOr<void> _getCartItems(
      _GetCartItems event, Emitter<CartState> emit) async {
    emit(const CartState.loading());
    final result = await _getCartItemsUsecase(NoParams());
    result.fold(
      (error) {
        emit(CartState.error(message: error.message));
      },
      (cartItems) {
        emit(CartState.loaded(cartItems: cartItems));
      },
    );
  }

  FutureOr<void> _addToCart(_AddToCart event, Emitter<CartState> emit) async {
    state.whenOrNull(
      loaded: (cartItems) async {
        if (!cartItems.any(
          (element) => element.productId == event.product.id,
        )) {
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

          final result = await _saveCartUsecase(newCartItems);
          result.fold(
            (error) {
              emit(CartState.error(message: error.message));
            },
            (cartItems) {
              emit(CartState.loaded(cartItems: newCartItems));
            },
          );
        }
      },
    );
  }

  FutureOr<void> _clearCart(_ClearCart event, Emitter<CartState> emit) async {
    final result = await _clearCartUsecase.call(NoParams());
    result.fold(
      (error) {
        emit(CartState.error(message: error.message));
      },
      (cartItems) {
        emit(const CartState.loaded(cartItems: []));
      },
    );
  }

  FutureOr<void> _removeFromCart(
      _RemoveFromCart event, Emitter<CartState> emit) async {
    state.whenOrNull(
      loaded: (cartItems) async {
        final newCartItems = [
          ...cartItems.where((element) => element.productId != event.productId)
        ];
        final result = await _saveCartUsecase(newCartItems);
        result.fold(
          (error) {
            emit(CartState.error(message: error.message));
          },
          (cartItems) {
            emit(CartState.loaded(cartItems: newCartItems));
          },
        );
      },
    );
  }
}
