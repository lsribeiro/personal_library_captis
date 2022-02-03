import 'package:personal_library_captis/core/constants/individual_type.dart';
import 'package:personal_library_captis/data/data_sources/remote/info_data_source.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
import 'package:personal_library_captis/domain/repositories/info_repository.dart';

class InfoRepositoryImpl extends InfoRepository {
  final InfoDataSource _remote;

  InfoRepositoryImpl(this._remote);

  @override
  Future<Individual?> getCharacter(int id) async {
    final queryResult = await _remote.getCharacter(id);
    if (queryResult != null) {
      final data = queryResult["data"]["results"][0];
      final character = Individual.fromMap(data);
      return character.copyWith(type: IndividualType.character);
    }
  }

  @override
  Future<Comic?> getComic(int id) async {
    final queryResult = await _remote.getComic(id);
    if (queryResult != null) {
      final data = queryResult["data"]["results"][0];
      final comic = Comic.fromMap(data);
      return comic;
    }
  }

  @override
  Future<Individual?> getCreator(int id) async {
    final queryResult = await _remote.getCreator(id);
    if (queryResult != null) {
      final data = queryResult["data"]["results"][0];
      final creator = Individual.fromMap(data);
      return creator.copyWith(type: IndividualType.creator);
    }
  }
}
