import 'package:flutter/material.dart';
import '../data/model/article.dart';
import 'article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routename =  '/article_detail';

  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView (
        child: Column(
          children: <Widget>[
            article.urlToImage == null
              ? Container(
                height: 200,
                child: Icon(Icons.error),
              )
            : Hero(
              tag: article.urlToImage!,
              child: Image.network(article.urlToImage!)
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    article.description ?? "",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(color: Colors.grey,),
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  const Divider(color: Colors.grey,),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(height: 10,),
                  Text('Author: ${article.author}'),
                  const Divider(color: Colors.grey,),
                  Text(
                    article.content ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ArticleWebView.routeName, arguments: article.url);
                    },
                    child: const Text("Read More")
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}