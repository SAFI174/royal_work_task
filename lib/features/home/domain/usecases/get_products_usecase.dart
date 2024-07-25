import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/home/domain/entities/product.dart';
import 'package:royal_task/features/home/domain/repositories/home_repo.dart';

class GetProductsUsecase implements Usecase<List<Product>, bool> {
  final HomeRepo homeRepo;

  GetProductsUsecase({required this.homeRepo});
  @override
  Future<Either<Failure, List<Product>>> call(bool isRefresh) {
    return homeRepo.getProducts(isRefresh: isRefresh);
  }
}
