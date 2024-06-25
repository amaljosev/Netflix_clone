part of 'movies_bloc.dart';

abstract class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class LoadingMoviesState extends MoviesState {}

final class LoadingMoviesSuccessState extends MoviesState {
  final List<GetMoviesEntity> popularMoviesList;
  final List<GetMoviesEntity> topRatedMoviesList;
  final List<GetMoviesEntity> trendingMoviesList;
  final List<TvSeriesEntity> popularTvSeriesList;
  final List<TvSeriesEntity> arrivingTodayTvSeriesList;
  final List<TvSeriesEntity> topTvSeriesList;
  LoadingMoviesSuccessState(
      {required this.popularMoviesList,
      required this.topRatedMoviesList,
      required this.trendingMoviesList,
      required this.popularTvSeriesList,
      required this.arrivingTodayTvSeriesList,
      required this.topTvSeriesList});
}

final class LoadingMoviesErrorState extends MoviesState {}
