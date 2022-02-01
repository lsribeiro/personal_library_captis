import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

abstract class SearchRepository {
  Future<List<ComicList>> searchComics(String? searchText);
  Future<List<Individual>> searchCharacters(String? searchText);
  Future<List<Individual>> searchCreators(String? searchText);
}
