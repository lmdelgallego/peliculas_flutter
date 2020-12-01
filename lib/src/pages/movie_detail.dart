import 'package:flutter/material.dart';
import 'package:peliculas_flutter/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  // final Movie movie;
  // const MovieDetail({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(child: Text(movie.overview)),
    );
  }
}
