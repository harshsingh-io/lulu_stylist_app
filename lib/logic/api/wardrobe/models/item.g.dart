// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      colors: json['colors'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
      isFavorite: json['isFavorite'] as bool,
      price: (json['price'] as num).toInt(),
      userId: json['userId'] as String,
      imageLocalPath: json['imageLocalPath'] as String,
      imageData: json['imageData'] as String,
      notes: json['notes'] as String,
      size: json['size'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'colors': instance.colors,
      'brand': instance.brand,
      'category': instance.category,
      'isFavorite': instance.isFavorite,
      'price': instance.price,
      'userId': instance.userId,
      'imageLocalPath': instance.imageLocalPath,
      'imageData': instance.imageData,
      'notes': instance.notes,
      'size': instance.size,
      'tags': instance.tags,
    };
