import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_newsapp/models/newsArticle.dart';
import 'package:http/http.dart' as http;

class WebService {

  Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a4323253e55c4c0a96310a94dcd1a00b'),
      headers: {
        HttpHeaders.authorizationHeader: 'a4323253e55c4c0a96310a94dcd1a00b',
      },
    );
    if(response.statusCode == 200) {

      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();

    }else{
      throw Exception("Failed to get data.");
    }
  }
}