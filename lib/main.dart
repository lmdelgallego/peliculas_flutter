import 'package:flutter/material.dart';
import 'package:peliculas_flutter/src/pages/home_page.dart';
import 'package:peliculas_flutter/src/pages/movie_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'details': (BuildContext context) => MovieDetail()
      },
    );
  }
}
