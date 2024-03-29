import 'package:personal_library_captis/data/repositories/search_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

class SearchCharactersUseCase {
  final SearchRepositoryImpl _repo;

  SearchCharactersUseCase(this._repo);

  Future<List<Individual>> call(String? searchText) async {
    return _repo.searchCharacters(searchText);
  }
}