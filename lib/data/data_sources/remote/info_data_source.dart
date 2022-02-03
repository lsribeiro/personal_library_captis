import 'package:personal_library_captis/core/http/fetch_data.dart';

class InfoDataSource {
  Future<Map<String, dynamic>?> getComic(int id) async {
    final response = await fetchData("comics/$id");

    return response.data;
  }

  Future<Map<String, dynamic>?> getCharacter(int id) async {
    final response = await fetchData("characters/$id");

    return response.data;
  }
  Future<Map<String, dynamic>?> getCreator(int id) async {
    final response = await fetchData("creators/$id");

    return response.data;
  }

}