import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/entities/get_movies_entity.dart';
import 'package:netflix/domain/entities/tv_series_entity.dart';
import 'package:netflix/domain/usecases/get_movies_usecases.dart';
import 'package:netflix/domain/usecases/get_tvseries_usecases.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {

    on<GetMoviesEvent>((event, emit) async {
      emit(LoadingMoviesState());
      try {
        final popularMovies =
            await GetMoviesUsecases().getPopularMoviesFromDataSource();
        final topRatedMovies =
            await GetMoviesUsecases().getTopRatedMoviesFromDataSource();
        final tredingMovies =
            await GetMoviesUsecases().getTrendingMoviesFromDataSource();
        final popularTvSeries =
            await GetTvseriesUsecases().getPopularTvSeries();
        final arrivingTodayTvSeries =
            await GetTvseriesUsecases().getArrivingTodayTvSeries();
        final topTvSeries = await GetTvseriesUsecases().getTopTvSeries();
        emit(LoadingMoviesSuccessState(
            popularMoviesList: popularMovies,
            topRatedMoviesList: topRatedMovies,
            trendingMoviesList: tredingMovies,
            popularTvSeriesList: popularTvSeries,
            arrivingTodayTvSeriesList: arrivingTodayTvSeries,
            topTvSeriesList: topTvSeries));
      } catch (e) {
        throw Exception('Exception found : $e');
      }
    });

  }
}
