import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/domain/constants/search_types.dart';
import 'package:personal_library_captis/domain/usecases/search/search_characters_use_case.dart';
import 'package:personal_library_captis/domain/usecases/search/search_comics_use_case.dart';
import 'package:personal_library_captis/core/di/injection_container.dart' as di;
import 'package:personal_library_captis/domain/usecases/search/search_creators_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(
          SearchState(searchResults: []),
        );

  void executeQuery() async {
    final _searchComicsUseCase = di.sl.get<SearchComicsUseCase>();
    final _searchCharactersUseCase = di.sl.get<SearchCharactersUseCase>();
    final _searchCreatorsUseCase = di.sl.get<SearchCreatorsUseCase>();

    final _searchResults = [];
    final futures = <Future>[];

    if (state.isComicsSelected) {
      futures.add(_searchComicsUseCase.call("spider"));
    }

    if (state.isCharactersSelected) {
      futures.add(_searchCharactersUseCase.call("spider"));
    }

    if (state.isCreatorsSelected) {
      futures.add(_searchCreatorsUseCase.call("spider"));
    }

    await Future.wait(futures).then((value) {
      value.forEach((element) {
        element.forEach((e) {
          _searchResults.add(e);
        });
        // _searchResults.addAll(element);
      });
    });

    print(_searchResults.length);

    emit(state.copyWith(searchResults: _searchResults));

    print(state.searchResults);

    print("State search_cubit.dart");
  }

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
