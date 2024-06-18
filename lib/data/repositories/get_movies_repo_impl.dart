import 'package:netflix/data/datasources/get_movies_datasource.dart';
import 'package:netflix/domain/entities/get_movies_entity.dart';
import 'package:netflix/domain/repositories/get_movies_repo.dart';

class GetMoviesRepoImpl extends GetMoivesRepo {
  GetMoviesDatasource getMoviesDatasource = GetMoviesDatasourceImpl();
  @override
  Future<List<GetMoviesEntity>> getPopularMovies() {
    final movies = getMoviesDatasource.getPopularMoviesFromApi();
    return movies;
  }

  @override
  Future<List<GetMoviesEntity>> getTopRatedMovies() {
    final movies = getMoviesDatasource.getTopRatedMoviesFromApi();
    return movies;
  }

  @override
  Future<List<GetMoviesEntity>> getTrendingMovies() {
    final movies = getMoviesDatasource.getTrendingMoviesFromApi();
    return movies;
  }
}
