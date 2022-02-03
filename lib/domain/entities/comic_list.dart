import 'package:hive/hive.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';

part 'comic_list.g.dart';

@HiveType(typeId: 0)
class ComicList {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<Comic> comics = [];

  int get quantity => comics.length;

//<editor-fold desc="Data Methods">

  ComicList({
    required this.id,
    required this.name,
    required this.comics,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicList &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          comics == other.comics);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ comics.hashCode;

  @override
  String toString() {
    return 'ComicList{' + ' id: $id,' + ' name: $name,' + ' comics: $comics,' + '}';
  }

  ComicList copyWith({
    String? id,
    String? name,
    List<Comic>? comics,
  }) {
    return ComicList(
      id: id ?? this.id,
      name: name ?? this.name,
      comics: comics ?? this.comics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'comics': this.comics,
    };
  }

  factory ComicList.fromMap(Map<String, dynamic> map) {
    return ComicList(
      id: map['id'] as String,
      name: map['name'] as String,
      comics: map['comics'] as List<Comic>,
    );
  }

//</editor-fold>
}