part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetNewsEvent extends HomeEvent {
  final GetNews getNews;

  GetNewsEvent(this.getNews);

  Future<List<dynamic>> callNews() async {
    return await getNews.callNews();
  }
}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  final List<NewsEntity> news;
  HomeLoadedEvent({required this.news});
}

class HomeErrorEvent extends HomeEvent {
  final String message;
  HomeErrorEvent({required this.message});
}

class RefreshNewsEvent extends HomeEvent {
  List<Object> get props => [];
}
