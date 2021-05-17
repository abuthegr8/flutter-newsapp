import 'package:flutter/material.dart';
import 'package:flutter_newsapp/models/newsArticle.dart';
import 'package:flutter_newsapp/services/webService.dart';
import 'package:flutter_newsapp/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>.empty();

  NewsArticleListViewModel() {
    _insertTopNews();
  }

  Future<void> _insertTopNews() async {
    List<NewsArticle> newsArticles = await WebService().fetchNews();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}