class GetMoviesEntity {
  final String title;
  final String imgPath;
  final String overview;
  final String releaseDate;
  final String posterPath;

  GetMoviesEntity(
      {required this.title,
      required this.imgPath,
      required this.overview,
      required this.releaseDate,
      required this.posterPath});
}
