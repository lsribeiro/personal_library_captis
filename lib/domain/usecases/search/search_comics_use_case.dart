import 'package:personal_library_captis/data/repositories/search_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';

class SearchComicsUseCase {
  final SearchRepositoryImpl _repo;

  SearchComicsUseCase(this._repo);

  Future<List<ComicList>> call(String? searchText) async {
    return _repo.searchComics(searchText);
  }
}