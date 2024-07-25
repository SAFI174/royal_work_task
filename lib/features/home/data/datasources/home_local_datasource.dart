import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:royal_task/features/home/data/models/category_model.dart';

import '../../../../core/errors/failure.dart';
import '../models/product_model.dart';

abstract class HomeLocalDatasource {
  Future<List<ProductModel>> getProducts();
  Future<void> saveProducts(List<ProductModel> products);

  Future<List<CategoryModel>> getCategories();

  Future<void> saveCategories(List<CategoryModel> categories);
}

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  final GetStorage _box;

  HomeLocalDatasourceImpl({required GetStorage box}) : _box = box;
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

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final categoriesRaw = _box.read<List<dynamic>>('categories') ?? [];
      return categoriesRaw
          .map((item) => CategoryModel.fromJson(jsonDecode(item as String)))
          .toList();
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<void> saveCategories(List<CategoryModel> categories) async {
    try {
      final categoriesRaw =
          categories.map((item) => jsonEncode(item.toJson())).toList();
      _box.write('categories', categoriesRaw);
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
