import 'package:news_app/features/home/data/repositories/news_remote_data.dart';
import 'package:news_app/features/home/domain/repositories/news_repository.dart';

class NewsRepositoryImp implements NewsRepository {
  final NewsRemoteData newsRemoteDataSource;
  NewsRepositoryImp({required this.newsRemoteDataSource});

  @override
  Future<List<dynamic>> fetchNewsData() async {
    try {
      final newsModels = await newsRemoteDataSource.fetchNews();
      return newsModels.map((newsModel) => newsModel).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
