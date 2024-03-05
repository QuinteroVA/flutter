import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../animations/fade_animations.dart';
import '../widgets/blur_container.dart';
import '../widgets/infotitle_widget.dart';
import '../pages/info_auto.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.modelo,
    required this.color,
    required this.imagen,
    required this.marca,
    required this.transmision,
    required this.traccion,
    required this.anio
  });

  final String modelo;
  final String color;
  final String imagen;
  final String marca;
  final String transmision;
  final String traccion;
  final String anio;

  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  double alturadepantalla = 0;
  List<Auto> autos = [];
  
  @override
  void initState() {super.initState(); _cargarAutos();}

  Future<void> _cargarAutos() async {
    final String data = await rootBundle.loadString('assets/autos.json');
    final List<dynamic> jsonData = json.decode(data);

    setState(() {
      autos = jsonData.map((autoJson) => Auto.fromJson(autoJson)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    alturadepantalla = MediaQuery.of(context).size.height;
    Auto auto = autos.firstWhere(
      (auto) => auto.modelo == widget.modelo,
      orElse: () => Auto(
        modelo: '',
        imagen: '',
        marca: '',
        transmision: '',
        traccion: '',
        anio: '', 
        color: '',
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: alturadepantalla * 0.6,
                    child: Hero(tag: widget.color, child: Image.asset(widget.imagen)),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: FadeAnimation(
                        intervalEnd: 0.8,
                        child: BlurContainer(
                          child: Container(
                            width: 160,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.2)), 
                            child: Text(
                              widget.modelo,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black), 
                            ),
                          ),
                        )))
              ],
            ),
            const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.3,
                  child: Text(widget.modelo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                )),
            const SizedBox(height: 5),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.35,
                  child: Text(
                    "Modelo",
                    style: TextStyle(color: Colors.black), 
                  ),
                )),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(intervalStart: 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoTitle(title: auto.transmision, subTitle: "Transmisión"),
                    InfoTitle(title: auto.traccion, subTitle: "Tracción"),
                    InfoTitle(title: auto.anio.toString(), subTitle: "Año")
                  ],
                ),
              ),
            ),
            const Spacer(),
            FadeAnimation(
              intervalStart: 0.5,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.3)),
                  child: const Text("Volver",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}