import 'package:netflix/data/repositories/get_movies_repo_impl.dart';
import 'package:netflix/domain/entities/get_movies_entity.dart';
import 'package:netflix/domain/repositories/get_movies_repo.dart';

class GetMoviesUsecases {
  GetMoivesRepo getMoivesRepo = GetMoviesRepoImpl();
  Future<List<GetMoviesEntity>> getPopularMoviesFromDataSource() {
    final movies = getMoivesRepo.getPopularMovies();
    return movies;
  }
  Future<List<GetMoviesEntity>> getTopRatedMoviesFromDataSource() {
    final movies = getMoivesRepo.getTopRatedMovies();
    return movies;
  }
  Future<List<GetMoviesEntity>> getTrendingMoviesFromDataSource() {
    final movies = getMoivesRepo.getTrendingMovies(); 
    return movies;
  }
}
