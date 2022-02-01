import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/domain/constants/search_types.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(
          SearchState(),
        );

  void toggleSearchOption(SearchTypes option) {
    switch(option) {
      case SearchTypes.comics:
        emit(state.copyWith(isComicsSelected: !state.isComicsSelected));
        break;
      case SearchTypes.characters:
        emit(state.copyWith(isCharactersSelected: !state.isCharactersSelected));
        break;
      case SearchTypes.creators:
        emit(state.copyWith(isCreatorsSelected: !state.isCreatorsSelected));
        break;
    }

  }
}
