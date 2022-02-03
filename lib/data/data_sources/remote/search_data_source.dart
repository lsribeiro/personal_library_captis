import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:personal_library_captis/core/http/fetch_data.dart';

class SearchDataSource {
  Future<Map<String, dynamic>> searchComics(String? searchText) async {
    final response = await fetchData("comics?titleStartsWith=$searchText");

    return response.data;
  }

  Future<Map<String, dynamic>> searchCharacters(String? searchText) async {
    final response = await fetchData("characters?nameStartsWith=$searchText");

    return response.data;
  }

  Future<List<Map<String, dynamic>>> searchCreators(String? searchText) async {
    final futures = <Future>[];
    futures.add(fetchData("creators?nameStartsWith=$searchText"));
    futures.add(fetchData("creators?firstNameStartsWith=$searchText"));
    futures.add(fetchData("creators?middleNameStartsWith=$searchText"));
    futures.add(fetchData("creators?lastNameStartsWith=$searchText"));

    final creatorsData = <Map<String, dynamic>>[];

    final futuresResult = await Future.wait(futures);

    futuresResult.forEach((element) {
      creatorsData.add(element.data);
    });

    return creatorsData;
  }
}
