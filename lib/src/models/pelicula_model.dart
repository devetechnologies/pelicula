class Peliculas {
  List<Pelicula> items = [];

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final pelicula = Pelicula.fromjsonMap(item);

      items.add(pelicula);
    }
  }
}

class Pelicula {
  late String uniqueId;
  late int id;
  late String lenguajeOriginal;
  late String tituloOriginal;
  late String overview;
  late int popularidad;
  late String posterImg;
  late String fecLanzamiento;
  late String titulo;
  late String video;
  late int votosAveraje;
  late int cantidadVotos;
  late dynamic createdAt;
  late dynamic updatedAt;

  Pelicula(
      {
      required  this.id,
      required this.lenguajeOriginal,
      required this.tituloOriginal,
      required this.overview,
      required this.popularidad,
      required this.posterImg,
      required this.fecLanzamiento,
      required this.titulo,
      required this.video,
      required this.votosAveraje,
      required this.cantidadVotos,
      required this.createdAt,
     required this.updatedAt});

  Pelicula.fromjsonMap(Map<String, dynamic> json) {
    id = json['id'];
    lenguajeOriginal = json['lenguaje_original'];
    tituloOriginal = json['titulo_original'];
    overview = json['overview'];
    popularidad = json['popularidad'];
    posterImg = json['poster_img'];
    fecLanzamiento = json['fec_lanzamiento'];
    titulo = json['titulo'];
    video = json['video'];
    votosAveraje = json['votos_averaje'];
    cantidadVotos = json['cantidad_votos'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  getPosterImage() {
    if (posterImg.isEmpty) {
      return 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg';
    } else {
      return 'https://pelicula.devetechnologies.com/public/$posterImg'; //'http://localhost/pelicula_admin/public/$posterImg';
    }
  }

  getBackgroundImage() {
    if (posterImg.isEmpty) {
      return 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg';
    } else {
      return 'https://pelicula.devetechnologies.com/public/$posterImg'; //'http://localhost/pelicula_admin/public/$posterImg'; uso local
    }
  }
}
