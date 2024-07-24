import 'package:royal_task/features/products/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.creationAt,
    required super.updatedAt,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
