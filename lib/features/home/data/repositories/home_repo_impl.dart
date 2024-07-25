
import 'package:dartz/dartz.dart';

import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/network/network_info.dart';
import 'package:royal_task/features/home/data/datasources/home_local_datasource.dart';
import 'package:royal_task/features/home/data/datasources/home_remote_datasoruce.dart';

import 'package:royal_task/features/home/domain/entities/product.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasoruce homeRemoteDatasoruce;
  final HomeLocalDatasource homeLocalDatasource;
  final NetworkInfo networkInfo;

  HomeRepoImpl(
      {required this.homeRemoteDatasoruce,
      required this.networkInfo,
      required this.homeLocalDatasource});
  @override
  Future<Either<Failure, List<Product>>> getProducts(
      {required bool isRefresh}) async {
    try {
      final localeProducts = await homeLocalDatasource.getProducts();
      if (!(await networkInfo.isConnected) && !isRefresh) {
        if (localeProducts.isEmpty) {
          throw ServerFailure(message: 'No internet connection');
        }
        return right(localeProducts);
      }
      if (localeProducts.isNotEmpty && !isRefresh) {
        return right(localeProducts);
      }
      final products = await homeRemoteDatasoruce.getProducts();
      await homeLocalDatasource.saveProducts(products);
      return right(products);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories(
      {required bool isRefresh}) async {
    try {
      final localeCategories = await homeLocalDatasource.getCategories();

      if (!(await networkInfo.isConnected) && !isRefresh) {
        if (localeCategories.isEmpty) {
          throw ServerFailure(message: 'No internet connection');
        }
        return right(localeCategories);
      }
      if (localeCategories.isNotEmpty && !isRefresh) {
        return right(localeCategories);
      }
      final res = await homeRemoteDatasoruce.getCategories();
      await homeLocalDatasource.saveCategories(res);
      return right(res);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
