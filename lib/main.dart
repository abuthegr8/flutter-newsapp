import 'package:flutter/material.dart';
import 'package:flutter_newsapp/pages/newslist.dart';
import 'package:flutter_newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsList(),
      )
    );
  }
}



