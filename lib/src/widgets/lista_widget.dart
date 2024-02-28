import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import 'package:flutter/cupertino.dart';

class listaAutos extends StatefulWidget {
  const listaAutos({super.key});

  @override
  State<listaAutos> createState() => _listaAutosState();
}

class _listaAutosState extends State<listaAutos> {
  double widthPantalla = 0;
  final titleTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    widthPantalla = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Autos Disponibles",
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              bloquePortada("auto1.jpg", " Marca X", "2021"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquePortada("auto2.jpg", " Marca Y", "2021"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquePortada("auto3.jpg", " Marca Z", "2021")
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          bloqueAutos("Modelo A", 0xff21E295, "auto4"),
          bloqueAutos("Modelo B", 0xff21E295, "auto5"),
          bloqueAutos("Modelo C", 0xff21E295, "auto6"),
          bloqueAutos("Modelo D", 0xff21E295, "auto7"),
          bloqueAutos("Modelo E", 0xff21E295, "auto8"),
          bloqueAutos("Modelo F", 0xff21E295, "auto9"),
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

  Widget bloquePortada(String image, String titulo, String subTitulo) {
    return Column(
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
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ))
      ],
    );
  }
}
