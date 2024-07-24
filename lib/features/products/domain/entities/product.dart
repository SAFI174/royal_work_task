import 'category.dart';

class Product {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  String creationAt;
  String updatedAt;
  Category category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });
}
