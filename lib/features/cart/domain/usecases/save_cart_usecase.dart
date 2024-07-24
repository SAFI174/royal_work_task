import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/cart/domain/repositories/cart_repo.dart';

import '../entities/cart_item.dart';

class SaveCartUsecase implements Usecase<void, List<CartItem>> {
  final CartRepo cartRepo;

  SaveCartUsecase({required this.cartRepo});
  @override
  Future<Either<Failure, void>> call(List<CartItem> params) {
    return cartRepo.saveCartItems(cartItems: params);
  }
}
