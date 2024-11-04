// lib/models/tag.dart

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'tag.g.dart';

@HiveType(typeId: 1)
class Tag extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  Tag({required this.id, required this.name});

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
