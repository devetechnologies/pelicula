import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pelicula/src/models/actores_model.dart';
import 'package:pelicula/src/models/pelicula_model.dart';
import 'package:pelicula/src/providers/peliculas_providers.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula),
           SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            _posterTitulo(context, pelicula),
            _descripcion(pelicula)

          ])),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.titulo,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImage()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
 Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: NetworkImage(pelicula.getPosterImage()),
                  height: 100.0,
                ),
              )),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.titulo,
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                pelicula.tituloOriginal,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border),
                  Text(
                    pelicula.votosAveraje.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
  
  Widget _descripcion(Pelicula pelicula){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: Text(pelicula.overview,textAlign: TextAlign.justify,),
    );

  }

  Widget _crearCasting(Pelicula pelicula){
    final peliculaProvider = PeliculaProvider();
    return FutureBuilder(
      future: peliculaProvider.getActores(pelicula.id.toString()),
      builder: (context, AsyncSnapshot snapshot){
        return _createActoresPageView(snapshot.data);
      });
  }

  Widget _createActoresPageView(List<Actor> actores){
    return SizedBox();
  }
}
