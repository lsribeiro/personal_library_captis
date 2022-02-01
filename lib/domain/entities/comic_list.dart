import 'package:personal_library_captis/domain/entities/comic.dart';

class ComicList {
  String name;
  List<Comic> comics = [];

  int get quantity => comics.length;

//<editor-fold desc="Data Methods">

  ComicList({
    required this.name,
    required this.comics,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicList &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          comics == other.comics);

  @override
  int get hashCode => name.hashCode ^ comics.hashCode;

  @override
  String toString() {
    return 'ComicList{' + ' name: $name,' + ' comics: $comics,' + '}';
  }

  ComicList copyWith({
    String? name,
    List<Comic>? comics,
  }) {
    return ComicList(
      name: name ?? this.name,
      comics: comics ?? this.comics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'comics': this.comics,
    };
  }

  factory ComicList.fromMap(Map<String, dynamic> map) {
    return ComicList(
      name: map['name'] as String,
      comics: map['comics'] as List<Comic>,
    );
  }

//</editor-fold>
}