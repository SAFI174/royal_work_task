import 'dart:convert';

import '../../domain/entities/product.dart';
import 'category_model.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.images,
    required super.creationAt,
    required super.updatedAt,
    required CategoryModel super.category,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images'].map((x) {
        try {
          return jsonDecode(x).first;
        } catch (e) {
          return x.toString();
        }
      })),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: CategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    data['category'] = (category as CategoryModel).toJson();
    return data;
  }
}
