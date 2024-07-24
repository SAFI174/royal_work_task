import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/features/cart/domain/entities/cart_item.dart';
import 'package:royal_task/features/cart/domain/repositories/cart_repo.dart';
import '../datasoruce/cart_local_data_source.dart';
import '../models/cart_item_model.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource cartLocalDataSource;

  CartRepoImpl({required this.cartLocalDataSource});

  @override
  Future<Either<Failure, void>> clearCartItems() async {
    try {
      await cartLocalDataSource.clearCartItems();
      return right(null);
    } on CacheFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    try {
      final cartItemModels = await cartLocalDataSource.getCartItems();
      return right(cartItemModels);
    } on CacheFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveCartItems({
    required List<CartItem> cartItems,
  }) async {
    try {
      final cartItemModels = cartItems
          .map((item) => CartItemModel(
              productId: item.productId,
              title: item.title,
              price: item.price,
              quantity: item.quantity,
              image: item.image))
          .toList();
      await cartLocalDataSource.saveCartItems(cartItemModels);
      return right(null);
    } on CacheFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(CacheFailure(message: e.toString()));
    }
  }
}
