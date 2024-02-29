import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import 'package:flutter/cupertino.dart';

class ListaAutos extends StatefulWidget {
  const ListaAutos({super.key});
  @override
  State<ListaAutos> createState() => _ListaAutosState();
}

class _ListaAutosState extends State<ListaAutos> {
  double widthPantalla = 0;
  final tituloStyleText = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  String seleccionarMarca = '';

  @override
  Widget build(BuildContext context) {
    widthPantalla = MediaQuery.of(context).size.width - 50;

    // Filtra los autos según la marca seleccionada
    List<Map<String, dynamic>> autosFiltrados = [];
    if (seleccionarMarca.isNotEmpty) {
      autosFiltrados =
          autos.where((auto) => auto['marca'] == seleccionarMarca).toList();
    } else {
      autosFiltrados = List.from(autos);
    }

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Vehículos Disponibles",
            style: tituloStyleText,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              bloqueMarcas("chevy.jpg", "Chevrolet"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloqueMarcas("kia.jpg", "Kia"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloqueMarcas("hyun.jpg", "Hyundai"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          // Muestra solo los autos filtrados
          for (var auto in autosFiltrados)
            bloqueAutos(auto['modelo'], auto['color'], auto['imagen']),
        ],
      ),
    );
  }

  Widget bloqueAutos(String modelo, int color, String imagen) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DetailPage(
                color: color, image: "assets/$imagen.png", modelo: modelo)))
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 56, 55, 55)),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                        spreadRadius: 0.0,
                        blurStyle: BlurStyle.normal,
                        color: Color(color))
                  ], borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(8),
                  child: Hero(
                      tag: color, child: Image.asset("assets/$imagen.png")),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  modelo,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget bloqueMarcas(String image, String titulo) {
    return GestureDetector(
      onTap: () {
        setState(() {
          seleccionarMarca = titulo;
        });
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset("assets/$image",
                width: widthPantalla * 0.31, height: 110, fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(
            text: titulo,
            style: TextStyle(
                color: seleccionarMarca == titulo ? Colors.blue : Colors.white70,
                fontSize: 14),
          ))
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> autos = [
  {'modelo':'Grove','color':0xff4913C4,'imagen':'chevy1','marca':'Chevrolet'},
  {'modelo':'All New Montana RS','color':0xffF82A2D,'imagen':'chevy2','marca':'Chevrolet'},
  {'modelo':'Onix Turbo Sedán','color':0xff21E295,'imagen':'chevy3','marca':'Chevrolet'},
  {'modelo':'Seltos','color':0xffFFCB28, 'imagen':'kia1', 'marca':'Kia'},
  {'modelo':'Rio S','color':0xffFE4649, 'imagen':'kia2', 'marca':'Kia'},
  {'modelo':'Sorento','color':0xffF82A2D, 'imagen':'kia3', 'marca':'Kia'},
  {'modelo':'All New Tucson','color':0xffDF1C6A,'imagen':'hyun1','marca':'Hyundai'},
  {'modelo':'Creta','color':0xff21E295,'imagen':'hyun2','marca':'Hyundai'},
  {'modelo':'Elantra','color':0xffFFCB28,'imagen':'hyun3','marca':'Hyundai'},
];
