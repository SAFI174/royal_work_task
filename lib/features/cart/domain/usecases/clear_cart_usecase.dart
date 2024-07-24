import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/cart/domain/repositories/cart_repo.dart';

class ClearCartUsecase implements Usecase<void, NoParams> {
  final CartRepo cartRepo;

  ClearCartUsecase({required this.cartRepo});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return cartRepo.clearCartItems();
  }
}
