import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    home: Scaffold(
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
              onTap: () {},
              child: Icon(Icons.thumb_up, color: Colors.blue, size: 80),
            ),
            Text("0", style: TextStyle(fontSize: 30)),
            Icon(Icons.thumb_down, color: Colors.red, size: 80),
          ],
        ),
      ),
    ),
  );
  runApp(myApp);
}

Widget myButton({
  required void Function()? traitement,
  required String texte,
  required double l,
  required double h,
  Color couleur = Colors.green,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Center(
      child: SizedBox(
        height: h,
        width: l,
        child: ElevatedButton(
          onPressed: traitement,
          child: Text(texte),
          style: ElevatedButton.styleFrom(
            backgroundColor: couleur,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
    ),
  );
}
