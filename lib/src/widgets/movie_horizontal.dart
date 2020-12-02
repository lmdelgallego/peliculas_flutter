import 'package:flutter/material.dart';
import 'package:peliculas_flutter/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  MovieHorizontal({@required this.movies, @required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _cards(context),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) =>
            _card(context, movies[index]),
      ),
    );
  }

  Widget _card(BuildContext context, Movie movie) {
    final movieCard = Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movie.getPosterImg()),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: movieCard,
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }

  List<Widget> _cards(BuildContext context) {
    return movies.map((movie) {
      return _card(context, movie);
    }).toList();
  }
}
