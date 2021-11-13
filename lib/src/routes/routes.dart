import 'package:flutter/material.dart';
import 'package:pelicula/src/pages/home_page.dart';
import 'package:pelicula/src/pages/pelicula_detalle.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'detalle': (BuildContext context) => PeliculaDetalle(),
  };
}
