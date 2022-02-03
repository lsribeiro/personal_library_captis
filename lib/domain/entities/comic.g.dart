// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComicAdapter extends TypeAdapter<Comic> {
  @override
  final int typeId = 1;

  @override
  Comic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comic(
      id: fields[1] as int,
      thumbnail: fields[2] as String,
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Comic obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
