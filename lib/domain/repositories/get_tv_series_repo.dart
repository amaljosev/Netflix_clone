import 'package:netflix/domain/entities/tv_series_entity.dart';

abstract class GetTvSeriesRepo {
    Future<List<TvSeriesEntity>>getPopularTvSeries();
    Future<List<TvSeriesEntity>>getArrivingTodayTvSeries();
    Future<List<TvSeriesEntity>>getTopTvSeries();
  }