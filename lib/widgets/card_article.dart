import 'package:dicoding_news_app/common/styles.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:dicoding_news_app/ui/article_detail_page.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.author ?? ""),
        onTap: () => Navigator.pushNamed(
          context,
          ArticleDetailPage.routename,
          arguments: article,
        ),
      ),
    );
  }
}