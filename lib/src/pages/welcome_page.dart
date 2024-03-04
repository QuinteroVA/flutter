import 'package:flutter/material.dart';
import 'package:concesionario/src/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Concesionaria',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/logo.png',
              width: 370,
              height: 370,
            ),
            const Text(
              'Mi Carro Nuevo',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60), // Ajusta el tamaño del botón
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 20), // Ajusta el tamaño del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
