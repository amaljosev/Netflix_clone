
import 'package:netflix/domain/entities/tv_series_entity.dart';

class TvSeriesModel extends TvSeriesEntity {
  TvSeriesModel(
      {required super.name,
      required super.posterPath,
      required super.firstAirDate,
      required super.overview,
      required super.backdropPath});

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) {
   
    return TvSeriesModel(
        name: json['original_name']??'',
        posterPath: json['poster_path']??'',
        firstAirDate: json['first_air_date']??'',
        overview: json['overview']??'',
        backdropPath: json['backdrop_path']??'');
  }
}
