import 'package:flutter/material.dart';
import '../models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articales;
  const NewsListView({super.key, required this.articales});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articales.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: NewsTile(articleModel: articales[index]),
        );
      }),
    );
  }
}
