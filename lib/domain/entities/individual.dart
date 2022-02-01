class Individual {
  String thumbnail;
  String name;
  int numberOfComics;
  int quantityOfListsIncluded;

//<editor-fold desc="Data Methods">

  Individual({
    required this.thumbnail,
    required this.name,
    required this.numberOfComics,
    required this.quantityOfListsIncluded,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Individual &&
          runtimeType == other.runtimeType &&
          thumbnail == other.thumbnail &&
          name == other.name &&
          numberOfComics == other.numberOfComics &&
          quantityOfListsIncluded == other.quantityOfListsIncluded);

  @override
  int get hashCode =>
      thumbnail.hashCode ^
      name.hashCode ^
      numberOfComics.hashCode ^
      quantityOfListsIncluded.hashCode;

  @override
  String toString() {
    return 'Individual{' +
        ' thumbnail: $thumbnail,' +
        ' name: $name,' +
        ' numberOfComics: $numberOfComics,' +
        ' quantityOfListsIncluded: $quantityOfListsIncluded,' +
        '}';
  }

  Individual copyWith({
    String? thumbnail,
    String? name,
    int? numberOfComics,
    int? quantityOfListsIncluded,
  }) {
    return Individual(
      thumbnail: thumbnail ?? this.thumbnail,
      name: name ?? this.name,
      numberOfComics: numberOfComics ?? this.numberOfComics,
      quantityOfListsIncluded: quantityOfListsIncluded ?? this.quantityOfListsIncluded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': this.thumbnail,
      'name': this.name,
      'numberOfComics': this.numberOfComics,
      'quantityOfListsIncluded': this.quantityOfListsIncluded,
    };
  }

  factory Individual.fromMap(Map<String, dynamic> map) {
    return Individual(
      thumbnail: map['thumbnail'] as String,
      name: map['name'] as String,
      numberOfComics: map['numberOfComics'] as int,
      quantityOfListsIncluded: map['quantityOfListsIncluded'] as int,
    );
  }

//</editor-fold>
}