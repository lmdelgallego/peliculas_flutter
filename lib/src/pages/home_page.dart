import 'package:flutter/material.dart';
import 'package:peliculas_flutter/src/providers/movies_provider.dart';
import 'package:peliculas_flutter/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final movieProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [_swiperCards()],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: movieProvider.getPlayNow(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(list: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );

    // movieProvider.getPlayNow();
    // return CardSwiper(list: [1, 2, 3, 4, 5]);
  }
}
