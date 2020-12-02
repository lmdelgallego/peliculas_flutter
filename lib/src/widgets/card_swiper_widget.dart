import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas_flutter/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> list;

  CardSwiper({@required this.list});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          list[index].uniqueId = '${list[index].id}-tarjeta';
          return Hero(
            tag: list[index].uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: buildFadeInImage(context, list[index])),
          );
        },
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: list.length,
        // autoplay: true,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }

  Widget buildFadeInImage(BuildContext context, Movie movie) {
    final imgFade = FadeInImage(
      image: NetworkImage(movie.getPosterImg()),
      placeholder: AssetImage('assets/img/no-image.jpg'),
      fit: BoxFit.cover,
    );

    return GestureDetector(
      child: imgFade,
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
