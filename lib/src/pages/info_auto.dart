class Auto {
  final String color;
  final String modelo;
  final String imagen;
  final String marca;
  final String transmision;
  final String traccion;
  final String anio;
  Auto({
    required this.color,
    required this.modelo,
    required this.imagen,
    required this.marca,
    required this.transmision,
    required this.traccion,
    required this.anio,
  });

  factory Auto.fromJson(Map<String, dynamic> json) {
    return Auto(
      modelo: json['modelo'],
      color: json['color'],
      imagen: json['imagen'],
      marca: json['marca'],
      transmision: json['transmision'],
      traccion: json['traccion'],
      anio: json['anio'],
    );
  }
}
