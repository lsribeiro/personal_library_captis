import 'package:personal_library_captis/data/repositories/comic_list_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:uuid/uuid.dart';

class CreateComicListUseCase {
  final ComicListRepositoryImpl _repo;

  CreateComicListUseCase(this._repo);

  Future<List<ComicList>> call(String comicListName) {
    final comicList = ComicList(id: Uuid().v4(), name: comicListName, comics: []);
    return _repo.createComicList(comicList);
  }
}