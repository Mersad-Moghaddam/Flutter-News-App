import 'dart:convert';
import 'dart:developer';

import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRemoteData {
  // final dioClient = Dio();

  Future<List<dynamic>> fetchNews() async {
    try {
      final http.Response response = await http
          .get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=23a5be907e9042d0a6da7aca118f1329",
      ))
          .timeout(const Duration(seconds: 60), onTimeout: () {
        log("Connection Timeout");
        throw Exception("Connection Timeout");
      });
      // print(response.data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<NewsModel> news = jsonData["articles"]
            .map<NewsModel>((json) => NewsModel.fromJson(json))
            .toList();
        log(news.toString());
        return news;
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
