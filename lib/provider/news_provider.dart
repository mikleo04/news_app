import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:flutter/cupertino.dart';

enum ResultState {loading, noData, hashData, error}

class NewsProvider extends ChangeNotifier {
  final ApiServices apiServices;

  NewsProvider({required this.apiServices}) {
    _fecthAllArticle();
  }

  late ArticlesResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  ArticlesResult get result => _articlesResult;
  ResultState get state => _state;

  Future<dynamic> _fecthAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiServices.topHeadLines();
      if (article.articles.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hashData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}