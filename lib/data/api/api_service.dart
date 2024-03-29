import 'dart:convert';
import '../model/article.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'e6945fdc94bc4c69af9c228152fe962b';
    static const String _category = 'business';
  static const String _country = 'us';

  Future<ArticlesResult> topHeadLines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if(response.statusCode == 200 ) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load headlines');
    }
  }
}