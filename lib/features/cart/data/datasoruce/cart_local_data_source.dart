import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/features/cart/data/models/cart_item_model.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> saveCartItems(List<CartItemModel> cartItemModel);
  Future<void> clearCartItems();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final GetStorage _box;

  CartLocalDataSourceImpl({required GetStorage box}) : _box = box;

  @override
  Future<void> clearCartItems() async {
    try {
      await _box.remove('cart_items');
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final cartItemsJson = _box.read<List<dynamic>>('cart_items') ?? [];
      return cartItemsJson
          .map((item) => CartItemModel.fromJson(jsonDecode(item as String)))
          .toList();
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<void> saveCartItems(List<CartItemModel> cartItemModel) async {
    try {
      final cartItemsJson =
          cartItemModel.map((item) => jsonEncode(item.toJson())).toList();
      await _box.write('cart_items', cartItemsJson);
    } catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
