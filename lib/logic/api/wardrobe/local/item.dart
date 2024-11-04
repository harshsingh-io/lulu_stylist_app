// lib/models/item.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'category.dart';
import 'tag.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final List<String> colors;

  @HiveField(4)
  final String brand;

  @HiveField(5)
  final Category category;

  @HiveField(6)
  final bool isFavorite;

  @HiveField(7)
  final double price;

  @HiveField(8)
  final String userId;

  @HiveField(9)
  final String imageLocalPath;

  @HiveField(10)
  final String imageData;

  @HiveField(11)
  final String notes;

  @HiveField(12)
  final String size;

  @HiveField(13)
  final List<Tag> tags;

  Item({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.colors,
    required this.brand,
    required this.category,
    required this.isFavorite,
    required this.price,
    required this.userId,
    required this.imageLocalPath,
    required this.imageData,
    required this.notes,
    required this.size,
    required this.tags,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      name: map['name'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      colors: List<String>.from(map['colors'] as List<dynamic>),
      brand: map['brand'] as String,
      category: Category.values.firstWhere(
          (e) => e.toString() == 'Category.${map['category']}',
          orElse: () => Category.OTHER),
      isFavorite: map['isFavorite'] as bool,
      price: (map['price'] as num).toDouble(),
      userId: map['userId'] as String,
      imageLocalPath: map['imageLocalPath'] as String,
      imageData: map['imageData'] as String,
      notes: map['notes'] as String,
      size: map['size'] as String,
      tags: (map['tags'] as List<dynamic>)
          .map((tagMap) => Tag.fromMap(tagMap as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'colors': colors,
      'brand': brand,
      'category': category.toString().split('.').last,
      'isFavorite': isFavorite,
      'price': price,
      'userId': userId,
      'imageLocalPath': imageLocalPath,
      'imageData': imageData,
      'notes': notes,
      'size': size,
      'tags': tags.map((tag) => tag.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        colors,
        brand,
        category,
        isFavorite,
        price,
        userId,
        imageLocalPath,
        imageData,
        notes,
        size,
        tags,
      ];
}
