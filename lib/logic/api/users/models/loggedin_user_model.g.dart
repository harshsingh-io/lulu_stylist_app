// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loggedin_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedInUserModelImpl _$$LoggedInUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoggedInUserModelImpl(
      accessToken: json['accessToken'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoggedInUserModelImplToJson(
        _$LoggedInUserModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'user': instance.user,
    };
