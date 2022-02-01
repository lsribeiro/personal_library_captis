import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class SearchDataSource {
  Future<Map<String, dynamic>> searchComics(String? searchText) async {
    final response = await fetchData("comics?titleStartsWith=$searchText");

    return response.data;
  }

  Future<Map<String, dynamic>> searchCharacters(String? searchText) async {
    final response = await fetchData("characters?titleStartsWith=$searchText");

    return response.data;
  }

  Future<Map<String, dynamic>> searchCreators(String? searchText) async {
    final response = await fetchData("creators?titleStartsWith=$searchText");

    return response.data;
  }

  Future<Response<dynamic>> fetchData(String queryPath) async {
    final pubKey = "aff32995afc69d19ee24d32386e5f4c9";
    final privateKey = "851570be8354a0446a052579b43147d307be0ea6";
    final ts = DateTime.now().millisecondsSinceEpoch;

    final hash = md5.convert(utf8.encode("$ts$privateKey$pubKey")).toString();

    final Map<String, dynamic> apiParameters = {
      "apikey": pubKey,
      "ts": ts,
      "hash": hash,
    };

    return await Dio()
        .get("https://gateway.marvel.com/v1/public/$queryPath", queryParameters: apiParameters);
  }
}
