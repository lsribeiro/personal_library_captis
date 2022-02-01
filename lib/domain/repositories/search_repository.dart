import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

abstract class SearchRepository {
  Future<List<Comic>> searchComics(String? searchText);
  Future<List<Individual>> searchCharacters(String? searchText);
  Future<List<Individual>> searchCreators(String? searchText);
}
