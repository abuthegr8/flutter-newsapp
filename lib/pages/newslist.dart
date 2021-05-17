import 'package:flutter/material.dart';
import 'package:flutter_newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Top News"),
        backgroundColor: Colors.deepOrange[600],
      ),
      body: ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index) {

          final article = vm.articles[index];

          _launchURL() async {
            String url = article.url;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          }

          return ListTile(
            leading: Container(
              width: 100,
              height: 100,
              child: article.imageURL == null? Image.asset("images/newsDefault.png") :
              Image.network(article.imageURL)),
            title : TextButton(
                child: Text(article.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: _launchURL,
            ),
          );
        }
      )
    );
  }
}