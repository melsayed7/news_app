import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '204cd5e07430461e919cd532f87a7f0e';

// 500c5a4f9b244f3db92a47f436f1819e
// 7861220fedd4485cb3288fdd8c4abc50
// 2e8b89193da249e5a3d8e9c11cf911ae me
// 204cd5e07430461e919cd532f87a7f0e
// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

  static Future<SourcesResponse> getSources(String categoryID) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryID});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourceResponse = SourcesResponse.fromJson(json);
      return sourceResponse;
    } catch (error) {
      throw error;
    }
  }

  //https://newsapi.org/v2/everything?sources=bitcoin&apiKey=2e8b89193da249e5a3d8e9c11cf911ae
  static Future<NewsResponse> getNews(
      {String? sourceID, String? text, int? page}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceID,
      'q': text,
      'pageSize': '20',
      'page': '$page',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (error) {
      throw error;
    }
  }

}
