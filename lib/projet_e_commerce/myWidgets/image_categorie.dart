import 'package:flutter/material.dart';

class ImageCategorie extends StatelessWidget {
  String titre;
  String urlImage;

  ImageCategorie({super.key, required this.titre, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(titre),
          SizedBox(
            height: 120,
            width: 200,
            child: Image.asset(urlImage, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
