import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';
import '../widgets/blur_container.dart';
import '../widgets/infotitle_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.color,
    required this.image,
    required this.modelo,
  });

  final String color;
  final String image;
  final String modelo;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double alturadepantalla = 0;

  @override
  Widget build(BuildContext context) {
    alturadepantalla = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarImage(),
            const SizedBox(height: 30),
            _buildCarDetails(),
            const Spacer(),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarImage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            height: alturadepantalla * 0.6,
            child: Hero(tag: widget.color, child: Image.asset(widget.image)),
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
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Text(
                  widget.modelo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          FadeAnimation(
            intervalStart: 0.3,
            child: Text(
              widget.modelo,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.35,
              child: Text(
                "Modelo",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoTitle(title: "Modelo", subTitle: "Modelo"),
                  InfoTitle(title: "2024", subTitle: "Año")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return FadeAnimation(
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
            color: Colors.blue.withOpacity(0.3),
          ),
          child: const Text(
            "Volver",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
