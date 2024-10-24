import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/useCases/get_news.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNews _getNews;

  HomeBloc(this._getNews) : super(HomeInitial()) {
    on<GetNewsEvent>(_onGetNewsEvent);
    on<RefreshNewsEvent>(_onRefreshNewsEvent);
  }

  Future<void> _onGetNewsEvent(
      GetNewsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final news = await _getNews.callNews();
    emit(HomeLoaded(news));
  }

  Future<void> _onRefreshNewsEvent(
    RefreshNewsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final news = await _getNews.callNews();
    emit(HomeLoaded(news));
  }
}
