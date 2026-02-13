import 'package:flutter/material.dart';

class Compteur extends StatefulWidget {
  const Compteur({super.key});

  @override
  State<Compteur> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Compteur> {
  int cpt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            InkWell(
              onTap: () {
                setState(() {
                  print("click sur UP");
                  cpt += 1;
                  print("cpt=$cpt");
                });
              },
              child: Icon(Icons.thumb_up, color: Colors.blue, size: 80),
            ),
            Text(cpt.toString(), style: TextStyle(fontSize: 30)),
            InkWell(
              onTap: () {
                setState(() {
                  print("click sur DOWN");
                  cpt -= 1;
                  print("cpt=$cpt");
                });
              },
              child: Icon(Icons.thumb_down, color: Colors.red, size: 80),
            ),
          ],
        ),
      ),
    );
  }
}
