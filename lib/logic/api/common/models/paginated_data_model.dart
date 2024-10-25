import 'package:freezed_annotation/freezed_annotation.dart';


part 'paginated_data_model.freezed.dart';
part 'paginated_data_model.g.dart';


@Freezed(genericArgumentFactories: true)
class PaginatedDataModel<T> with _$PaginatedDataModel {
  const factory PaginatedDataModel({
    required List<T> items,
    required int page, //On which page you want to toggle
    required int total, //Total No. of object should be in api
    required int size,
    required int pages, //Total No. of pages
  }) = _PaginatedDataModel;

  /// Connect the generated [_$LoginRequestModelFromJson] function to the `fromJson`
  /// factory.
  factory PaginatedDataModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedDataModelFromJson(json, fromJsonT);
}
