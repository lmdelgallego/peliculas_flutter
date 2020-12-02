import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/src/models/actor_model.dart';

import 'package:peliculas_flutter/src/models/movie_model.dart';

class MovieProvider {
  String _apikey = '8ce10f42f2400aee9916db157d353148';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _loading = false;

  List<Movie> _popularMovies = new List();

  final _popularMoviesStreamController =
      StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularMoviesSink =>
      _popularMoviesStreamController.sink.add;
  Stream<List<Movie>> get popularMoviesStream =>
      _popularMoviesStreamController.stream;

  void disposeStreams() {
    _popularMoviesStreamController?.close();
  }

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
    if (_loading) return [];
    _loading = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _popularMovies.addAll(resp);
    popularMoviesSink(_popularMovies);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodeData = jsonDecode(resp.body);
    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actorsList;
  }
}
