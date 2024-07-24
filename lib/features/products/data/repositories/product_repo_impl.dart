import 'package:dartz/dartz.dart';

import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/network/network_info.dart';
import 'package:royal_task/features/products/data/datasources/products_local_datasource.dart';
import 'package:royal_task/features/products/data/datasources/products_remote_datasoruce.dart';

import 'package:royal_task/features/products/domain/entities/product.dart';

import '../../domain/repositories/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductsRemoteDataSoruce productsRemoteDataSoruce;
  final ProductsLocalDataSoruce productsLocalDataSoruce;
  final NetworkInfo networkInfo;

  ProductRepoImpl(
      {required this.productsRemoteDataSoruce,
      required this.networkInfo,
      required this.productsLocalDataSoruce});
  @override
  Future<Either<Failure, List<Product>>> getProducts(
      {required bool isRefresh}) async {
    try {
      final localeProducts = await productsLocalDataSoruce.getProducts();
      if (!(await networkInfo.isConnected)) {
        if (localeProducts.isEmpty) {
          throw ServerFailure(message: 'No internet connection');
        }
        return right(localeProducts);
      }
      if (localeProducts.isNotEmpty && !isRefresh) {
        return right(localeProducts);
      }
      final products = await productsRemoteDataSoruce.getProducts();
      await productsLocalDataSoruce.saveProducts(products);
      return right(products);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
