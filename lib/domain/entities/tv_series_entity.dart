class TvSeriesEntity {
  final String name;
  final String posterPath;
  final String firstAirDate;
  final String overview;
  final String backdropPath;

  TvSeriesEntity(
      {required this.name,
      required this.posterPath,
      required this.firstAirDate,
      required this.overview,
      required this.backdropPath});
}
