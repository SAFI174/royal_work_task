import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/network/api_client.dart';
import 'package:royal_task/core/network/endpoints.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDatasoruce {
  Future<List<ProductModel>> getProducts();

  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDatasoruceImpl implements HomeRemoteDatasoruce {
  final ApiClient apiClient;

  HomeRemoteDatasoruceImpl({required this.apiClient});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final res = await apiClient.get(Endpoints.products);
      if (res.statusCode == 200) {
        final productsRaw = res.data as List<dynamic>;
        return productsRaw
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
      }
      throw ServerFailure(message: 'Failed to get products');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await apiClient.get(Endpoints.categories);
      if (res.statusCode == 200) {
        final categoriesRaw = res.data as List<dynamic>;
        return categoriesRaw.map((e) => CategoryModel.fromJson(e)).toList();
      }
      throw ServerFailure(message: 'Failed to get categories');
    } catch (e) {
      rethrow;
    }
  }
}
