import 'package:concesionario/src/pages/welcome_page.dart';
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
      backgroundColor: Colors.grey[900],
      body: const Column(
        children: <Widget>[Headerwidget(), ListaAutos()],
      ),
      //botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage()),
          );
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
