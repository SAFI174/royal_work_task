import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/features/products/domain/entities/product.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getProducts({required bool isRefresh});
}
