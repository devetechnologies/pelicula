import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pelicula/src/models/actores_model.dart';
import 'package:pelicula/src/models/pelicula_model.dart';

class PeliculaProvider {
  String _url = 'pelicula.devetechnologies.com';
  bool _cargando = false;
  List<Pelicula> _populares = [];

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  //#2
  Future<List<Pelicula>> _procesarPelicula(Uri url, String cabeceraJson) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData[cabeceraJson]);
    return peliculas.items;
  }

  //#3
  Future<List<Pelicula>> getCines() async {
    final url = Uri.https(_url, '/public/peliculas');
    // final url = Uri.http(_url, '/pelicula_admin/public/peliculas');//uso Local
    //  print(url);
    return _procesarPelicula(url, 'results');
  }

  //#4
  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) {
      return [];
    } else {
      _cargando = true;
    }
    final url = Uri.https(_url, '/public/populares_peliculas');
    // final url = Uri.http(_url, '/pelicula_admin/public/populares_peliculas');// uso local
    //print(url);
    final resp = await _procesarPelicula(url, 'results');
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getActores(String peliculaId) async {
    final url = Uri.https(_url, '/public/actor_pelicula',{'id_pelicula': peliculaId});
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final cast = Cast.fromJsonList(decodeData['results']);
    return cast.actores;
  }

  Future<List<Pelicula>> buscarPeliculas() async {
    final url = Uri.https(_url, '');
    return _procesarPelicula(url, '');
  }
}
