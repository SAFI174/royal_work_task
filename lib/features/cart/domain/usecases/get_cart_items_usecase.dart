import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/cart/domain/entities/cart_item.dart';
import 'package:royal_task/features/cart/domain/repositories/cart_repo.dart';

class GetCartItemsUsecase implements Usecase<List<CartItem>, NoParams> {
  final CartRepo cartRepo;

  GetCartItemsUsecase({required this.cartRepo});

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) {
    return cartRepo.getCartItems();
  }
}
