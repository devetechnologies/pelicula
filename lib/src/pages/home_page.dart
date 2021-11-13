import 'package:flutter/material.dart';
import 'package:pelicula/src/models/pelicula_model.dart';
import 'package:pelicula/src/providers/peliculas_providers.dart';
import 'package:pelicula/src/widgets/card_swiper_widget.dart';
import 'package:pelicula/src/widgets/movie_horizontal_widget.dart';

class HomePage extends StatelessWidget {
  PeliculaProvider _peliculas = new PeliculaProvider();
  final List<Pelicula> pelicula = [];
  @override
  Widget build(BuildContext context) {
    _peliculas.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Movies'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swipeTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swipeTarjetas() {
    return FutureBuilder(
        future: _peliculas.getCines(),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasData) {
            return CardSwiper(
              peliculas: snapshop.data,
            );
          } else {
            return Container(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }

  Widget _footer(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),
          StreamBuilder(
              stream: _peliculas.popularesStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(
                      peliculas: snapshot.data,
                      siguientePagina: _peliculas.getPopulares);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ]));
  }
}
