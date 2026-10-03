import 'dart:convert';

class ProductModels {
  final String id;
  final String title;
  final double price;
  final String categories;
  final String image;

  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.categories,
    required this.image,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      categories: json['categories'] ?? '',
      image: json['image'] ?? '',
    );
  }
}