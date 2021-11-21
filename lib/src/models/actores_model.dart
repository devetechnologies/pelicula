class Cast {
  List<Actor> actores = [];

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    }
  }
}

class Actor {
  late int id;
  late String nombre;
  late String nombreOriginal;
  late int popularidad;
  late String actorImg;
  late String actorPapel;
  late int idPelicula;
  late dynamic createdAt;
  late String updatedAt;
  late String lenguajeOriginal;
  late String tituloOriginal;
  late String overview;
  late String posterImg;
  late String fecLanzamiento;
  late String titulo;
  late String video;
  late int votosAveraje;
  late int cantidadVotos;

  Actor({
    required this.id,
    required this.nombre,
    required this.nombreOriginal,
    required this.popularidad,
    required this.actorImg,
    required this.actorPapel,
    required this.idPelicula,
    required this.createdAt,
    required this.updatedAt,
    required this.lenguajeOriginal,
    required this.tituloOriginal,
    required this.overview,
    required this.posterImg,
    required this.fecLanzamiento,
    required this.titulo,
    required this.video,
    required this.votosAveraje,
    required this.cantidadVotos,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    nombreOriginal = json['nombre_original'];
    popularidad = json['popularidad'];
    actorImg = json['actor_img'];
    actorPapel = json['actor_papel'];
    idPelicula = json['id_pelicula'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lenguajeOriginal = json['lenguaje_original'];
    overview = json['overview'];
    posterImg = json['poster_img'];
    fecLanzamiento = json['fec_lanzamiento'];
    titulo = json['titulo'];
    video = json['video'];
    votosAveraje = json['votos_averaje'];
    cantidadVotos = json['cantidad_votos'];
  }

  getFoto() {
    if (actorImg.isEmpty) {
      return 'https://www.brightlands.com/sites/default/files/2019-12/No%20avater.jpg';
    } else {
      return 'https://pelicula.devetechnologies.com/public/$actorImg'; //'http://localhost/pelicula_admin/public/$actorImg'; //uso local
    }
  }
}
