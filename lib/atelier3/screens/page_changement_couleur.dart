import 'package:flutter/material.dart';

class GestionCouleur extends StatefulWidget {
  const GestionCouleur({super.key});

  @override
  State<GestionCouleur> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GestionCouleur> {
  Color couleur = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur,
      appBar: AppBar(
        title: Text("My first Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (couleur == Colors.yellow)
                    couleur = Colors.white;
                  else
                    couleur = Colors.yellow;
                });
              },
              child: Text("Changer Couleur"),
            ),
          ],
        ),
      ),
    );
  }
}
