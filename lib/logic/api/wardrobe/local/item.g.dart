// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 0;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as String,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
      colors: (fields[3] as List).cast<String>(),
      brand: fields[4] as String,
      category: fields[5] as Category,
      isFavorite: fields[6] as bool,
      price: fields[7] as double,
      userId: fields[8] as String,
      imageLocalPath: fields[9] as String,
      imageData: fields[10] as String,
      notes: fields[11] as String,
      size: fields[12] as String,
      tags: (fields[13] as List).cast<Tag>(),
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.colors)
      ..writeByte(4)
      ..write(obj.brand)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.isFavorite)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.userId)
      ..writeByte(9)
      ..write(obj.imageLocalPath)
      ..writeByte(10)
      ..write(obj.imageData)
      ..writeByte(11)
      ..write(obj.notes)
      ..writeByte(12)
      ..write(obj.size)
      ..writeByte(13)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
