import 'package:flutter/material.dart';

class GestionIcone extends StatefulWidget {
  const GestionIcone({super.key});

  @override
  State<GestionIcone> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GestionIcone> {
  Color couleur = Colors.yellow;
  List<IconData> listIcones = [
    Icons.access_time_filled_sharp,
    Icons.abc,
    Icons.account_balance_outlined,
  ];
  int index = 0;
  int taille = 100;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(listIcones[index], size: 80),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (index < listIcones.length - 1)
                        index++;
                      else
                        index = 0;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.black,
                      child: Image.network(
                        "https://picsum.photos/$taille",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          taille++;
                        });
                      },
                      child: Text("Image Network"),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
