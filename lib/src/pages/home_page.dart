import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            'https://picsum.photos/300/300?random=1',
            fit: BoxFit.fill,
          );
        },
        layout: SwiperLayout.STACK,
        itemWidth: 200,
        itemCount: 3,
        // autoplay: true,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
