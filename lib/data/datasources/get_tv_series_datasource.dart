import 'dart:convert';
import 'dart:developer';

import 'package:netflix/data/models/tv_model.dart';
import 'package:http/http.dart' as http;

abstract class GetTvSeriesDatasource {
  Future<List<TvSeriesModel>> getPopularTvSeries();
  Future<List<TvSeriesModel>> getArrivingTodayTvSeries();
  Future<List<TvSeriesModel>> getTopTvSeries();
}

class GetTvSeriesDatasourceImpi extends GetTvSeriesDatasource {
  final clinet = http.Client();

  @override
  Future<List<TvSeriesModel>> getPopularTvSeries() async {
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/tv/popular?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
       
        final List<TvSeriesModel> tvSeries =
            data.map((series) => TvSeriesModel.fromJson(series)).toList();
            
        return tvSeries;
      } else {
        log(response.statusCode.toString());
        return <TvSeriesModel>[];
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
  
  @override
  Future<List<TvSeriesModel>> getArrivingTodayTvSeries() async{
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/tv/airing_today?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
       
        final List<TvSeriesModel> tvSeries =
            data.map((series) => TvSeriesModel.fromJson(series)).toList();
            
        return tvSeries;
      } else {
        log(response.statusCode.toString());
        return <TvSeriesModel>[];
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
  
  @override
  Future<List<TvSeriesModel>> getTopTvSeries() async{
    try {
      final uri = Uri.parse(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=e6227c69efda2538922e54d7b2abadcf');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
       
        final List<TvSeriesModel> tvSeries =
            data.map((series) => TvSeriesModel.fromJson(series)).toList();
            
        return tvSeries;
      } else {
        log(response.statusCode.toString());
        return <TvSeriesModel>[];
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
