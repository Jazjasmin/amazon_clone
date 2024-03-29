import 'dart:convert';

import 'package:amazon_admin_panel/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;
  String? id;
  String? userId;
  final List<Rating>? rating;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.images,
      this.rating,
      this.id,
      this.userId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'userId': userId,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'],
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images)']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      userId: map['userId'],
      rating: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map(
              (x) => Rating.fromMap(x),
            ))
          : null,
    );
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
