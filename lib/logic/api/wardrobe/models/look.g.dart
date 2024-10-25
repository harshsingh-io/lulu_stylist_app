// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'look.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LookImpl _$$LookImplFromJson(Map<String, dynamic> json) => _$LookImpl(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      description: json['description'] as String,
      lookImageData: json['lookImageData'] as String,
      lookWithUserImageData: json['lookWithUserImageData'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$LookImplToJson(_$LookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'name': instance.name,
      'description': instance.description,
      'lookImageData': instance.lookImageData,
      'lookWithUserImageData': instance.lookWithUserImageData,
      'userId': instance.userId,
    };
