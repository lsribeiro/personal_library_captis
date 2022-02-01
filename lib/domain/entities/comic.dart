import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

class Comic {
  String thumbnail;
  String title;
  Individual creator;
  String? description;
  String isbn;
  int pageCount;
  String series;
  List<Individual> characters;
  List<ComicList>? lists;
  List<String>? imageGallery;

//<editor-fold desc="Data Methods">

  Comic({
    required this.thumbnail,
    required this.title,
    required this.creator,
    this.description,
    required this.isbn,
    required this.pageCount,
    required this.series,
    required this.characters,
    this.lists,
    this.imageGallery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comic &&
          runtimeType == other.runtimeType &&
          thumbnail == other.thumbnail &&
          title == other.title &&
          creator == other.creator &&
          description == other.description &&
          isbn == other.isbn &&
          pageCount == other.pageCount &&
          series == other.series &&
          characters == other.characters &&
          lists == other.lists &&
          imageGallery == other.imageGallery);

  @override
  int get hashCode =>
      thumbnail.hashCode ^
      title.hashCode ^
      creator.hashCode ^
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
        ' thumbnail: $thumbnail,' +
        ' title: $title,' +
        ' creator: $creator,' +
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
    String? thumbnail,
    String? title,
    Individual? creator,
    String? description,
    String? isbn,
    int? pageCount,
    String? series,
    List<Individual>? characters,
    List<ComicList>? lists,
    List<String>? imageGallery,
  }) {
    return Comic(
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      creator: creator ?? this.creator,
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
      'thumbnail': this.thumbnail,
      'title': this.title,
      'creator': this.creator,
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
      thumbnail: "${map['thumbnail']['path']}${map['thumbnail']['ext']}",
      title: map['title'] as String,
      // creator: Individual.fromMap(map['creator']),
      creator: Individual(name: '', thumbnail: '', numberOfComics: 10, quantityOfListsIncluded: 10),
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