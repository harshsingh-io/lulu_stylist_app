// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedDataModelImpl<T> _$$PaginatedDataModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PaginatedDataModelImpl<T>(
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      page: (json['page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginatedDataModelImplToJson<T>(
  _$PaginatedDataModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'page': instance.page,
      'total': instance.total,
      'size': instance.size,
      'pages': instance.pages,
    };
