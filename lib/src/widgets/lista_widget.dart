import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import '../pages/detail_page.dart';

class ListaAutos extends StatefulWidget {
  const ListaAutos({Key? key}) : super(key: key);

  @override
  State<ListaAutos> createState() => _ListaAutosState();
}

class _ListaAutosState extends State<ListaAutos> {
  double widthPantalla = 0;
  final tituloStyleText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  String seleccionarMarca = '';
  List<Map<String, dynamic>> autos = [];

  @override
  void initState() {
    super.initState();
    _cargarAutos();
  }

  Future<void> _cargarAutos() async {
    final String data = await rootBundle.loadString('assets/autos.json');
    final List<dynamic> jsonData = json.decode(data);

    setState(() {
      autos = jsonData.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    widthPantalla = MediaQuery.of(context).size.width - 50;

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
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          const SizedBox(
            height: 20,
          ),
          for (var auto in autosFiltrados)
            bloqueAutos(auto['modelo'], auto['color'], auto['imagen']),
        ],
      ),
    );
  }

  Widget bloqueAutos(String modelo, String color, String imagen) {
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
            color: Colors.grey.withOpacity(0.1)),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 5),
                        spreadRadius: 0.0,
                        blurStyle: BlurStyle.normal,
                        //color: Color(color)
                        ),
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
            //submenu
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
              color: Colors.white,
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
            borderRadius: BorderRadius.circular(10),
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
                color: seleccionarMarca == titulo
                    ? Colors.lightBlue
                    : Colors.white,
                fontSize: 14),
          ))
        ],
      ),
    );
  }
}
