import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/core/di/injection_container.dart' as di;
import 'package:personal_library_captis/domain/usecases/comcic_list/get_comic_lists_use_case.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/update_comic_list_use_case.dart';

part 'comic_lists_state.dart';

class ComicListsCubit extends Cubit<ComicListsState> {
  ComicListsCubit() : super(ComicListsState());

  Future<List<ComicList>> getComicLists(int comicId) async {
    final _getComicListsUseCase = di.sl.get<GetComicListsUseCase>();
    final _comicLists = await _getComicListsUseCase.call();

    final checkedList = List.filled(_comicLists.length, false);

    for (var i = 0; i < _comicLists.length; i++) {
      for (var j = 0; j < _comicLists[i].comics.length; j++) {
        final comic = _comicLists[i].comics[j];
        if (comic.id == comicId) {
          checkedList[i] = true;
        }
      }
    }

    emit(state.copyWith(lists: _comicLists, checkedLists: checkedList));

    return _comicLists;
  }

  void toggleComicList(int index) {
    print("Calling toggle comicLst ");
    if (state.checkedLists != null) {
      final checkedLists = state.checkedLists?.map((e) => e).toList();

      checkedLists![index] = !checkedLists[index];

      print(checkedLists);

      emit(state.copyWith(checkedLists: checkedLists));
    }
  }

  Future<void> addComicToComicLists(Comic comic) async {
    final _updateComicListUseCase = di.sl.get<UpdateComicListUseCase>();

    if (state.lists != null) {
      final length = state.lists?.length ?? 0;

      for (var i = 0; i < length; i++) {
        final newComicList = state.lists![i];
        final comics = newComicList.comics;

        var found = false;
        var index;

        for (var j = 0; j < comics.length; j++) {
          if (comics[j].id == comic.id)  {
            found = true;
            index = j;
            break;
          }
        }

        if (!found && state.checkedLists![i])
          _updateComicListUseCase.call(i, newComicList.copyWith(comics: comics..add(comic)));
        else if (found && !state.checkedLists![i] && index != null) {
          _updateComicListUseCase.call(i, newComicList.copyWith(comics: comics..removeAt(index)));
        }
      }
    }
  }
}
