import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/features/home/domain/entities/product.dart';

import '../entities/category.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Product>>> getProducts({required bool isRefresh});

  Future<Either<Failure, List<Category>>> getCategories(
      {required bool isRefresh});
}
