import 'package:netflix/data/repositories/get_tvseries_repo_impli.dart';
import 'package:netflix/domain/entities/tv_series_entity.dart';
import 'package:netflix/domain/repositories/get_tv_series_repo.dart';

class GetTvseriesUsecases {
  GetTvSeriesRepo getTvSeriesRepo = GetTvseriesRepoImpli();

  Future<List<TvSeriesEntity>> getPopularTvSeries() {
    return getTvSeriesRepo.getPopularTvSeries();
  }

  Future<List<TvSeriesEntity>> getArrivingTodayTvSeries() {
    return getTvSeriesRepo.getArrivingTodayTvSeries();
  }

  Future<List<TvSeriesEntity>> getTopTvSeries() {
    return getTvSeriesRepo.getTopTvSeries();
  }
}
