import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';

class ComicListDataSource {
  //get comic lists

  // create comic list
  // delete comic list
  // rename comic list

  // add comic to comic list
  // remove comic from comic list

  // get comics from comic list

  ComicListDataSource() {
    Hive.registerAdapter(ComicListAdapter());
  }

  Future<dynamic> getComicLists() async {
    // TODO: Turn into constant
    final box = await Hive.openBox("comic_lists");

    return box.values;
  }

  Future<dynamic> createComicList(ComicList comicList) async {
    final box = Hive.box("comic_lists");

    await box.add(comicList);

    return box.values;
  }
}
