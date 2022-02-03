import 'package:personal_library_captis/core/constants/individual_type.dart';

class Individual {
  int id;
  IndividualType? type;
  String? thumbnail;
  String name;
  int? numberOfComics;
  int? quantityOfListsIncluded;

//<editor-fold desc="Data Methods">

  Individual({
    required this.id,
    this.type,
    this.thumbnail,
    required this.name,
    this.numberOfComics,
    this.quantityOfListsIncluded,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Individual &&
          id == other.id &&
          type == other.type &&
          runtimeType == other.runtimeType &&
          thumbnail == other.thumbnail &&
          name == other.name &&
          numberOfComics == other.numberOfComics &&
          quantityOfListsIncluded == other.quantityOfListsIncluded);

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      thumbnail.hashCode ^
      name.hashCode ^
      numberOfComics.hashCode ^
      quantityOfListsIncluded.hashCode;

  @override
  String toString() {
    return 'Individual{' +
        ' id: $id,' +
        ' type: $type,' +
        ' thumbnail: $thumbnail,' +
        ' name: $name,' +
        ' numberOfComics: $numberOfComics,' +
        ' quantityOfListsIncluded: $quantityOfListsIncluded,' +
        '}';
  }

  Individual copyWith({
    int? id,
    IndividualType? type,
    String? thumbnail,
    String? name,
    int? numberOfComics,
    int? quantityOfListsIncluded,
  }) {
    return Individual(
      id: id ?? this.id,
      type: type ?? this.type,
      thumbnail: thumbnail ?? this.thumbnail,
      name: name ?? this.name,
      numberOfComics: numberOfComics ?? this.numberOfComics,
      quantityOfListsIncluded: quantityOfListsIncluded ?? this.quantityOfListsIncluded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'type': this.type,
      'thumbnail': this.thumbnail,
      'name': this.name,
      'numberOfComics': this.numberOfComics,
      'quantityOfListsIncluded': this.quantityOfListsIncluded,
    };
  }

  factory Individual.fromMap(Map<String, dynamic> map) {
    var name = "";

    if (map['name'] != null) name = map['name'];
    if (map['firstName'] != null) name = "${map['firstName']} ${map['middleName']} ${map['lastName']}";

    return Individual(
      id: map['id'],
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
      name: name,
      numberOfComics: map['numberOfComics'] ?? 0,
      quantityOfListsIncluded: map['quantityOfListsIncluded'] ?? 0,
    );
  }

//</editor-fold>
}