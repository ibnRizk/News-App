import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'services/news_services.dart';
import 'views/home_view.dart';

void main() {
  NewsServices(Dio()).getNews();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
//a0a6fc5872fd4d13a7d7bdf4d3e8870b