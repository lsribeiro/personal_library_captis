import 'package:personal_library_captis/data/data_sources/local/comic_list_data_source.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/repositories/comic_list_repository.dart';

class ComicListRepositoryImpl implements ComicListRepository {
  final ComicListDataSource _local;

  ComicListRepositoryImpl(this._local);

  @override
  Future<List<ComicList>> getComicLists() async {
    final result = await _local.getComicLists();

    if (result != null) {
      final comicList = <ComicList>[];
      result.forEach((e) => comicList.add(e as ComicList));
      return comicList;
    }

    return [];
  }

  @override
  Future<List<ComicList>> createComicList(ComicList comicList) async {
    final result = await _local.createComicList(comicList);

    if (result != null) {
      final comicList = <ComicList>[];
      result.forEach((e) => comicList.add(e as ComicList));
      return comicList;
    }

    return [];
  }

}
