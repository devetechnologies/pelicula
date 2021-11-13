import 'package:flutter/material.dart';

import 'package:pelicula/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({required this.peliculas, required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas(context),
        itemBuilder: (context, index) {
          return _tarjeta(context, peliculas[index]);
        },
        itemCount: peliculas.length,
      ),
    );
  }

  //Crea una sola tarjeta
  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId ='Probando';// '${pelicula.id}-poster';

    // print('horizontal $pelicula.uniqueId');

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: ListView(
        children: <Widget>[
           Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(pelicula.titulo,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption)
          ],
        ),
        ],
        
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
