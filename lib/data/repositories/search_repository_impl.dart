import 'package:personal_library_captis/core/constants/individual_type.dart';
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

    return comicsResult;
  }

  @override
  Future<List<Individual>> searchCharacters(String? searchText) async {
    final queryResult = await _remote.searchCharacters(searchText);

    final results = queryResult["data"]["results"];

    final charactersResult = <Individual>[];

    results.forEach((element) {
      final character = Individual.fromMap(element);
      charactersResult.add(character.copyWith(type: IndividualType.character));
    });

    return charactersResult;
  }

  @override
  Future<List<Individual>> searchCreators(String? searchText) async {
    final queryResults = await _remote.searchCreators(searchText);

    final creatorsResult = <Individual>[];

    print("Search creators");
    print("Query Results");

    queryResults.forEach((element) {
      final result = element["data"]["results"];
      result.forEach((e) {
        final creator = Individual.fromMap(e);
        creatorsResult.add(creator.copyWith(type: IndividualType.creator));
      });
    });

    print(creatorsResult.length);

    return creatorsResult;
  }
}
