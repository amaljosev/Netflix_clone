import 'dart:convert';
import 'dart:developer';

import 'package:netflix/data/models/movies_model.dart';
import 'package:http/http.dart' as http;

abstract class GetMoviesDatasource {
  Future<List<MoviesModel>> getPopularMoviesFromApi();
  Future<List<MoviesModel>> getTopRatedMoviesFromApi();
  Future<List<MoviesModel>> getTrendingMoviesFromApi();
}

class GetMoviesDatasourceImpl extends GetMoviesDatasource {
  final clinet = http.Client();
  @override
  Future<List<MoviesModel>> getPopularMoviesFromApi() async {
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];

        final List<MoviesModel> movies =
            data.map((movie) => MoviesModel.fromJson(movie)).toList();
        return movies;
      } else {
        log('statuscode: ${response.statusCode}');
        return <MoviesModel>[];
      }
    } catch (e) {
      throw Exception('exception found: $e');
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMoviesFromApi() async {
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];

        final List<MoviesModel> movies =
            data.map((movie) => MoviesModel.fromJson(movie)).toList();
        return movies;
      } else {
        log('statuscode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      throw Exception('exception found: $e');
    }
  }

  @override
  Future<List<MoviesModel>> getTrendingMoviesFromApi() async {
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];

        final List<MoviesModel> movies =
            data.map((movie) => MoviesModel.fromJson(movie)).toList();
        return movies;
      } else {
        log('statuscode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      throw Exception('exception found: $e');
    }
  }
}
