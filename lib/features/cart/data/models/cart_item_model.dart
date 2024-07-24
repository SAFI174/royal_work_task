import 'package:royal_task/features/cart/domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  CartItemModel({
    required super.productId,
    required super.title,
    required super.price,
    required super.quantity,
    required super.image,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['title'] = title;
    data['price'] = price;
    data['quantity'] = quantity;
    data['image'] = image;
    return data;
  }
}
