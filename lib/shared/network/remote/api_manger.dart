import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '2e8b89193da249e5a3d8e9c11cf911ae';

  //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

  static Future<SourcesResponse> getSources(String categoryID) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': '500c5a4f9b244f3db92a47f436f1819e', 'category': categoryID});
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
  static Future<NewsResponse> getNews(String sourceID) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': '500c5a4f9b244f3db92a47f436f1819e',
      'sources': sourceID,
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
