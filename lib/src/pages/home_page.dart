import 'package:flutter/material.dart';
import 'package:concesionario/src/widgets/header_widget.dart';
import 'package:concesionario/src/widgets/lista_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      body: const Column(
        children: <Widget>[Headerwidget(), ListaAutos()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 95, 25, 208),
        child: const Icon(Icons.add),
      ),
    );
  }
}
