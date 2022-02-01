import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

class Comic {
  String thumbnail;
  String title;
  Individual creator;
  String description;
  String isbn;
  String pageNumber;
  String series;
  List<Individual> characters;
  List<ComicList> lists;
  List<String>? imageGallery;

//<editor-fold desc="Data Methods">

  Comic({
    required this.thumbnail,
    required this.title,
    required this.creator,
    required this.description,
    required this.isbn,
    required this.pageNumber,
    required this.series,
    required this.characters,
    required this.lists,
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
          pageNumber == other.pageNumber &&
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
      pageNumber.hashCode ^
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
        ' pageNumber: $pageNumber,' +
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
    String? pageNumber,
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
      pageNumber: pageNumber ?? this.pageNumber,
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
      'pageNumber': this.pageNumber,
      'series': this.series,
      'characters': this.characters,
      'lists': this.lists,
      'imageGallery': this.imageGallery,
    };
  }

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      creator: map['creator'] as Individual,
      description: map['description'] as String,
      isbn: map['isbn'] as String,
      pageNumber: map['pageNumber'] as String,
      series: map['series'] as String,
      characters: map['characters'] as List<Individual>,
      lists: map['lists'] as List<ComicList>,
      imageGallery: map['imageGallery'] as List<String>,
    );
  }

//</editor-fold>
}