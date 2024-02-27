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
              bloqueAuto("auto1.jpg", "Modelo X", "2023", "\$50,000"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloqueAuto("auto2.jpg", "Modelo Y", "2022", "\$40,000"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloqueAuto("auto3.jpg", "Modelo Z", "2021", "\$30,000"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          bloqueAuto("auto4.jpg", "Modelo A", "2020", "\$20,000"),
          bloqueAuto("auto5.jpg", "Modelo B", "2019", "\$10,000"),
          bloqueAuto("auto6.jpg", "Modelo C", "2018", "\$5,000"),
        ],
      ),
    );
  }

  Widget bloqueAuto(String imagen, String modelo, String anio, String precio) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => DetailPage(
              image: "assets/$imagen.png",
              nombre: modelo,
              precio: precio,
              modelo: "Modelo $anio",
              marca: "Marca",
              color: '',
            ),
          ),
        )
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(66, 56, 55, 55),
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 5),
                        spreadRadius: 0.0,
                        blurStyle: BlurStyle.normal,
                        color: Colors.blue,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Hero(
                    tag: Colors.blue,
                    child: Image.asset("assets/$imagen.png"),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      modelo,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      anio,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  precio,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded),
                  color: Colors.grey,
                ),
              ],
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
                children: [
              TextSpan(
                  text: subTitulo,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12))
            ]))
      ],
    );
  }
}
