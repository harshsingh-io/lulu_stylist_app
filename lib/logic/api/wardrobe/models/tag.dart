import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
  }) = _Tag;

  /// Connect the generated [_$TagFromJson] function to the `fromJson`
  /// factory.
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  const Tag._();
}