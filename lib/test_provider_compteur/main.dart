import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet/test_provider_compteur/compteur_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CompteurProvider()),
      ],
      child: MaterialApp(home: PageTest()),
    ),
  );
}

class PageTest extends StatelessWidget {
  const PageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final compteur = context.watch<CompteurProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("TEst Compteur Provider")),
      body: Text(compteur.cpt.toString()),
    );
  }
}
