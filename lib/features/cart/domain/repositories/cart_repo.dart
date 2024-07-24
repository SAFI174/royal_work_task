import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/cart_item.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartItem>>> getCartItems();

  Future<Either<Failure, void>> saveCartItems({
    required List<CartItem> cartItems,
  });

  Future<Either<Failure, void>> clearCartItems();
}
