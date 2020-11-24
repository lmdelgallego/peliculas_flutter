import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas_flutter/src/models/movie_model.dart';

class MovieProvider {
  String _apikey = '8ce10f42f2400aee9916db157d353148';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getPlayNow() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }

  Future<List<Movie>> getPopular() async {
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apikey, 'language': _language});
    return await _procesarRespuesta(url);
  }
}
