import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/products/domain/entities/product.dart';
import 'package:royal_task/features/products/domain/repositories/product_repo.dart';

class GetProductsUsecase implements Usecase<List<Product>, bool> {
  final ProductRepo productRepo;

  GetProductsUsecase({required this.productRepo});
  @override
  Future<Either<Failure, List<Product>>> call(bool isRefresh) {
    return productRepo.getProducts(isRefresh: isRefresh);
  }
}
