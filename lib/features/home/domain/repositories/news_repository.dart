import 'package:news_app/features/home/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<dynamic>> fetchNewsData();

  // Future<List<NewsEntity>> fetchTopHeadlines();

  // Future<List<NewsEntity>> fetchEverything();
}
