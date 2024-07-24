import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../../../core/errors/failure.dart';
import '../models/product_model.dart';

abstract class ProductsLocalDataSoruce {
  Future<List<ProductModel>> getProducts();
  Future<void> saveProducts(List<ProductModel> products);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSoruce {
  final GetStorage _box;

  ProductsLocalDataSourceImpl({required GetStorage box}) : _box = box;
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final productsRaw = _box.read<List<dynamic>>('products') ?? [];
      return productsRaw
          .map((item) => ProductModel.fromJson(jsonDecode(item as String)))
          .toList();
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<void> saveProducts(List<ProductModel> products) async {
    try {
      final productsRaw =
          products.map((item) => jsonEncode(item.toJson())).toList();
      _box.write('products', productsRaw);
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
