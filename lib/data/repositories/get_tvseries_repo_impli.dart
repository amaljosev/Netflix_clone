import 'package:netflix/data/datasources/get_tv_series_datasource.dart';
import 'package:netflix/domain/entities/tv_series_entity.dart';
import 'package:netflix/domain/repositories/get_tv_series_repo.dart';

class GetTvseriesRepoImpli extends GetTvSeriesRepo {
  GetTvSeriesDatasource getTvSeriesDatasource = GetTvSeriesDatasourceImpi();
  @override
  Future<List<TvSeriesEntity>> getPopularTvSeries() {
    return getTvSeriesDatasource.getPopularTvSeries();
  }
  
  @override
  Future<List<TvSeriesEntity>> getArrivingTodayTvSeries() {
    return getTvSeriesDatasource.getArrivingTodayTvSeries();
  }
  
  @override
  Future<List<TvSeriesEntity>> getTopTvSeries() {
    return getTvSeriesDatasource.getTopTvSeries();
  }
}
