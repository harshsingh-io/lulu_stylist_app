// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceModelImpl _$$UserDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDeviceModelImpl(
      id: json['id'] as String,
      deviceToken: json['deviceToken'] as String,
      platform: json['platform'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserDeviceModelImplToJson(
        _$UserDeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceToken': instance.deviceToken,
      'platform': instance.platform,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
