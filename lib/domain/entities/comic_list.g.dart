// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComicListAdapter extends TypeAdapter<ComicList> {
  @override
  final int typeId = 0;

  @override
  ComicList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComicList(
      id: fields[0] as String,
      name: fields[1] as String,
      comics: (fields[2] as List).cast<Comic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ComicList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.comics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComicListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
