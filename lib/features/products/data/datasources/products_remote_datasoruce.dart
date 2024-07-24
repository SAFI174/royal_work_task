import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/network/api_client.dart';
import 'package:royal_task/core/network/endpoints.dart';

import '../models/product_model.dart';

abstract class ProductsRemoteDataSoruce {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSoruceImpl implements ProductsRemoteDataSoruce {
  final ApiClient apiClient;

  ProductsRemoteDataSoruceImpl({required this.apiClient});

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
}
