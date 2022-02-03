import 'package:personal_library_captis/data/repositories/info_repository_impl.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';

class GetComicUseCase {
  final InfoRepositoryImpl _repo;

  GetComicUseCase(this._repo);

  Future<Comic?> call(int id) async {
    return _repo.getComic(id);
  }
}