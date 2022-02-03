import 'package:personal_library_captis/data/repositories/comic_list_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';

class UpdateComicListUseCase {
  final ComicListRepositoryImpl _repo;

  UpdateComicListUseCase(this._repo);

  Future<List<ComicList>> call(int index, ComicList comicList) async {
    return _repo.updateComicList(index, comicList);
  }
}