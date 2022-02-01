part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final isComicsSelected;
  final isCharactersSelected;
  final isCreatorsSelected;

  @override
  List<Object> get props => [
        isComicsSelected,
        isCharactersSelected,
        isCreatorsSelected,
      ];

  const SearchState({
    this.isComicsSelected = false,
    this.isCharactersSelected = false,
    this.isCreatorsSelected = false,
  });

  bool getSearchOptionValue(SearchTypes option) {
    switch (option) {
      case SearchTypes.comics:
        return this.isComicsSelected;
      case SearchTypes.characters:
        return this.isCharactersSelected;
      case SearchTypes.creators:
        return this.isCreatorsSelected;
    }
  }

  SearchState copyWith({
    bool? isComicsSelected,
    bool? isCharactersSelected,
    bool? isCreatorsSelected,
  }) {
    return SearchState(
        isComicsSelected: isComicsSelected ?? this.isComicsSelected,
        isCharactersSelected: isCharactersSelected ?? this.isCharactersSelected,
        isCreatorsSelected: isCreatorsSelected ?? this.isCreatorsSelected);
  }
}
