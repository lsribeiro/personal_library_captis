import 'package:personal_library_captis/data/repositories/comic_list_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';

class GetComicListsUseCase {
  final ComicListRepositoryImpl _repo;

  GetComicListsUseCase(this._repo);

  Future<List<ComicList>> call() {
    return _repo.getComicLists();
  }
}