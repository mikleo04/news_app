import 'package:dicoding_news_app/common/navigation.dart';
import 'package:dicoding_news_app/common/styles.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:dicoding_news_app/provider/database_provider.dart';
import 'package:dicoding_news_app/ui/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
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
                trailing: isBookmarked
                ? IconButton(
                    onPressed: () => provider.removeBookmark(article.url),
                    icon: const Icon(Icons.bookmark),
                    color: Colors.purple,
                )
                : IconButton(
                    onPressed: () => provider.addBookmark(article),
                    icon: const Icon(Icons.bookmark_border),
                    color: Colors.purple,
                ),
                title: Text(article.title),
                subtitle: Text(article.author ?? ""),
                onTap: () => Navigation.intentWithData(ArticleDetailPage.routename, article),
              ),
            );
          }
        );
      }
    );
  }
}
