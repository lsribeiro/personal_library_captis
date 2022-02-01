import 'package:personal_library_captis/data/data_sources/remote/search_data_source.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
import 'package:personal_library_captis/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _remote;

  SearchRepositoryImpl(this._remote);

  @override
  Future<List<Comic>> searchComics(String? searchText) async {
    final queryResult = await _remote.searchComics(searchText);

    final results = queryResult["data"]["results"];

    final comicsResult = <Comic>[];

    results.forEach((element) {
      final comic = Comic.fromMap(element);
      comicsResult.add(comic);
    });


    Future.delayed(Duration.zero);
    return comicsResult;
  }

  @override
  Future<List<Individual>> searchCharacters(String? searchText) async {
    final queryResult = await _remote.searchCharacters(searchText);

    return Future.delayed(Duration.zero, () {
      return [];
    });
  }

  @override
  Future<List<Individual>> searchCreators(String? searchText) async {
    final queryResult = await _remote.searchCreators(searchText);

    return Future.delayed(Duration.zero, () {
      return [];
    });
  }
}
