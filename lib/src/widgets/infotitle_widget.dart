import 'package:flutter/material.dart';
class InfoTitle extends StatelessWidget {
  const InfoTitle({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
