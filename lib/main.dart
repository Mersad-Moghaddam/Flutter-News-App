import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/repositories/news_remote_data.dart';
import 'package:news_app/features/home/domain/repositories/news_repository_imp.dart';
import 'package:news_app/features/home/domain/useCases/get_news.dart';
import 'package:news_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:news_app/features/home/presentation/screen/home_screen.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => HomeBloc(GetNews(
          newsRepository:
              NewsRepositoryImp(newsRemoteDataSource: NewsRemoteData()))),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homescreen());
  }
}
