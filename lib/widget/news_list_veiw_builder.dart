import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/news_services.dart';
import 'news_list_veiw.dart';

class NewsListViewBulider extends StatefulWidget {
  const NewsListViewBulider({super.key});

  @override
  State<NewsListViewBulider> createState() => _NewsListViewBuliderState();
}

class _NewsListViewBuliderState extends State<NewsListViewBulider> {
  List<ArticleModel> articales = [];

  bool isloading = true;

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articales = await NewsServices(Dio()).getNews();
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        )
        : articales.isNotEmpty
        ? NewsListView(articales: articales)
        : const SliverToBoxAdapter(
          child: Center(child: Text('oops there was an error, try later')),
        );
  }
}
