import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/const/images.dart';
import 'package:projet/projet_e_commerce/myWidgets/image_carrousel.dart';
import 'package:projet/projet_e_commerce/myWidgets/image_categorie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'accueil"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //carrousel
          ImageCarrousel(),
          Text(
            "Categorie",
            style: TextStyle(
              backgroundColor: Colors.black,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(listeImageCategorie.length, (index) {
                return ImageCategorie(
                  titre: titreListeImageCategorie[index],
                  urlImage: listeImageCategorie[index],
                );
              }),
            ),
          ),
          Text(
            "Marque",
            style: TextStyle(
              backgroundColor: Colors.black,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(listeImageCategorie.length, (index) {
                return ImageCategorie(
                  titre: titreListeImageCategorie[index],
                  urlImage: listeImageCategorie[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
