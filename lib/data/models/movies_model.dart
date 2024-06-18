import 'package:netflix/domain/entities/get_movies_entity.dart';

class MoviesModel extends GetMoviesEntity {
  MoviesModel(
      {required super.title,
      required super.imgPath,
      required super.overview,
      required super.releaseDate,
      required super.posterPath});
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        title: json['title'],
        imgPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path']);
  }
}
