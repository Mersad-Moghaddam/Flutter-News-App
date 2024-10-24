import 'package:news_app/features/home/domain/repositories/news_repository.dart';

class GetNews {
  final NewsRepository newsRepository;

  GetNews({required this.newsRepository});

  Future<List<dynamic>> callNews() async {
    return await newsRepository.fetchNewsData();
  }
}
