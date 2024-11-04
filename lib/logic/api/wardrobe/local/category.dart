// lib/models/category.dart

import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
enum Category {
  @HiveField(0)
  TOP,

  @HiveField(1)
  BOTTOM,

  @HiveField(2)
  SHOES,

  @HiveField(3)
  ACCESSORIES,

  @HiveField(4)
  INNERWEAR,

  @HiveField(5)
  OTHER,
}
