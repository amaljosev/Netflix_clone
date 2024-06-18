  import 'package:netflix/domain/entities/get_movies_entity.dart';

abstract class GetMoivesRepo {
    Future<List<GetMoviesEntity>>getPopularMovies();
    Future<List<GetMoviesEntity>>getTopRatedMovies();
    Future<List<GetMoviesEntity>>getTrendingMovies();
  }
  