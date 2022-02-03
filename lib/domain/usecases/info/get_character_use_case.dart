import 'package:personal_library_captis/data/repositories/info_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

class GetCharacterUseCase {
  final InfoRepositoryImpl _repo;

  GetCharacterUseCase(this._repo);

  Future<Individual?> call(int id) async {
    return _repo.getCharacter(id);
  }
}