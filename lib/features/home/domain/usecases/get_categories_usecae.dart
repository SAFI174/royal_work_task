import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/features/home/domain/entities/category.dart';

import '../repositories/home_repo.dart';

class GetCategoriesUsecae implements Usecase<List<Category>, bool> {
  final HomeRepo homeRepo;

  GetCategoriesUsecae({required this.homeRepo});
  @override
  Future<Either<Failure, List<Category>>> call(bool isRefresh) {
    return homeRepo.getCategories(isRefresh: isRefresh);
  }
}
