import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';

abstract class InfoRepository {
  Future<Comic?> getComic(int id);
  Future<Individual?> getCharacter(int id);
  Future<Individual?> getCreator(int id);
}