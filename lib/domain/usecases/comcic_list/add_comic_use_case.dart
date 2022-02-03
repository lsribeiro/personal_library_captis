import 'package:personal_library_captis/data/repositories/comic_list_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/get_comic_lists_use_case.dart';

class AddComicUseCase {
  final ComicListRepositoryImpl _repo;
  final GetComicListsUseCase _getComicListsUseCase;

  AddComicUseCase(this._repo, this._getComicListsUseCase);

  void call(Comic comic, List<ComicList> lists) async {
    final _comicLists =  await _getComicListsUseCase.call();

    lists.forEach((comicList) {
      for (var i = 0; i < _comicLists.length; i++) {
        if (comicList.id == _comicLists[i].id) {
          _comicLists[i] = comicList.copyWith(comics: comicList.comics..add(comic));
        }
      }
    });
  }
}