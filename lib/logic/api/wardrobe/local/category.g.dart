// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.TOP;
      case 1:
        return Category.BOTTOM;
      case 2:
        return Category.SHOES;
      case 3:
        return Category.ACCESSORIES;
      case 4:
        return Category.INNERWEAR;
      case 5:
        return Category.OTHER;
      default:
        return Category.TOP;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.TOP:
        writer.writeByte(0);
        break;
      case Category.BOTTOM:
        writer.writeByte(1);
        break;
      case Category.SHOES:
        writer.writeByte(2);
        break;
      case Category.ACCESSORIES:
        writer.writeByte(3);
        break;
      case Category.INNERWEAR:
        writer.writeByte(4);
        break;
      case Category.OTHER:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
