import 'package:hive/hive.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

part 'comic.g.dart';

@HiveType(typeId: 1)
class Comic {
  @HiveField(1)
  int id;
  @HiveField(2)
  String thumbnail;
  @HiveField(3)
  String title;
  List<Individual>? creators;
  String? description;
  String? isbn;
  int? pageCount;
  String? series;
  List<Individual>? characters;
  List<ComicList>? lists;
  List<String>? imageGallery;

//<editor-fold desc="Data Methods">

  Comic({
    required this.id,
    required this.thumbnail,
    required this.title,
    this.creators,
    this.description,
    this.isbn,
    this.pageCount,
    this.series,
    this.characters,
    this.lists,
    this.imageGallery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comic &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          thumbnail == other.thumbnail &&
          title == other.title &&
          creators == other.creators &&
          description == other.description &&
          isbn == other.isbn &&
          pageCount == other.pageCount &&
          series == other.series &&
          characters == other.characters &&
          lists == other.lists &&
          imageGallery == other.imageGallery);

  @override
  int get hashCode =>
      id.hashCode ^
      thumbnail.hashCode ^
      title.hashCode ^
      creators.hashCode ^
      description.hashCode ^
      isbn.hashCode ^
      pageCount.hashCode ^
      series.hashCode ^
      characters.hashCode ^
      lists.hashCode ^
      imageGallery.hashCode;

  @override
  String toString() {
    return 'Comic{' +
        ' id: $id,' +
        ' thumbnail: $thumbnail,' +
        ' title: $title,' +
        ' creator: $creators,' +
        ' description: $description,' +
        ' isbn: $isbn,' +
        ' pageCount: $pageCount,' +
        ' series: $series,' +
        ' characters: $characters,' +
        ' lists: $lists,' +
        ' imageGallery: $imageGallery,' +
        '}';
  }

  Comic copyWith({
    int? id,
    String? thumbnail,
    String? title,
    List<Individual>? creators,
    String? description,
    String? isbn,
    int? pageCount,
    String? series,
    List<Individual>? characters,
    List<ComicList>? lists,
    List<String>? imageGallery,
  }) {
    return Comic(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      creators: creators ?? this.creators,
      description: description ?? this.description,
      isbn: isbn ?? this.isbn,
      pageCount: pageCount ?? this.pageCount,
      series: series ?? this.series,
      characters: characters ?? this.characters,
      lists: lists ?? this.lists,
      imageGallery: imageGallery ?? this.imageGallery,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'thumbnail': this.thumbnail,
      'title': this.title,
      'creator': this.creators,
      'description': this.description,
      'isbn': this.isbn,
      'pageCount': this.pageCount,
      'series': this.series,
      'characters': this.characters,
      'lists': this.lists,
      'imageGallery': this.imageGallery,
    };
  }

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      id: map["id"],
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
      title: map['title'] as String,
      // creator: Individual.fromMap(map['creator']),
      description: map['description'],
      isbn: map['isbn'] as String,
      pageCount: map['pageCount'] as int,
      series: map['series']['name'] as String,
      // characters: map['characters'] as List<Individual>,
      characters: [],
      // lists: map['lists'] as List<ComicList>,
      // imageGallery: map['images'] as List<String>,
      imageGallery: [],
    );
  }

//</editor-fold>
}