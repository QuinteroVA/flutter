class Auto {
  final String modelo;
  //final String color;
  final String imagen;
  final String marca;

  Auto({
    required this.modelo,
   //required this.color,
    required this.imagen,
    required this.marca,
  });

  factory Auto.fromJson(Map<String, dynamic> json) {
    return Auto(
      modelo: json['modelo'],
      //color: json['color'],
      imagen: json['imagen'],
      marca: json['marca'],
    );
  }
}