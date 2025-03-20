import 'package:dio/dio.dart';
import '../models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=a0a6fc5872fd4d13a7d7bdf4d3e8870b&category=general&country=us',
      );

      Map<String, dynamic> josnData = response.data;
      List<dynamic> articals = josnData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articals) {
        ArticleModel articleModel = ArticleModel(
          articleUrl: article['url'],
          image: article['urlToImage'],
          subTitle: article['description'],
          title: article['title'],
        );
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
