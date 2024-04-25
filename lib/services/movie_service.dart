import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/services/api_service.dart';

class MovieService {
  final ApiService apiService;

  MovieService(this.apiService);

  Future<List<MovieModel>> getMovies() async {
    final Response responce = await apiService.getResponse(HttpMethod.get,
        path: "/titles/x/upcoming");
    if (responce.statusCode >= 200 && responce.statusCode <= 300) {
      List<dynamic> decodedData = jsonDecode(responce.body)["results"];
      return decodedData.map((dynamic e) => MovieModel.fromJson(e)).toList();
    }
    throw ("resposed failed with status code ${responce.statusCode}");
  }

  Future<MovieModel> getMovieById(int id) async {
    List<MovieModel> data = await getMovies();
    return data[id];
  }
}
