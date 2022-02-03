import 'package:personal_library_captis/domain/entities/comic_list.dart';

abstract class ComicListRepository {
  Future<List<ComicList>> getComicLists();
  Future<List<ComicList>> createComicList(ComicList comicList);

  // Future<List<Comic>> searchComics(String? searchText);
  // Future<List<Individual>> searchCharacters(String? searchText);
  // Future<List<Individual>> searchCreators(String? searchText);
}
