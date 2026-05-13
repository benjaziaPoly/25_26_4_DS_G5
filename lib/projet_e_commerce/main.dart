import 'package:flutter/material.dart';
import 'package:projet/firebase_options.dart';
import 'package:projet/projet_e_commerce/pages/barre_navigation.dart';
import 'package:projet/projet_e_commerce/pages/favorite.dart';
import 'package:projet/projet_e_commerce/pages/home_page.dart';
import 'package:projet/projet_e_commerce/pages/meteo_screen.dart';
import 'package:projet/projet_e_commerce/pages/page_user.dart';
import 'package:projet/projet_e_commerce/pages/panier.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';
import 'package:projet/projet_e_commerce/pages/produit_list.dart';
import 'package:projet/projet_e_commerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Connect Firebase OK!");
  } catch (e) {
    print("Error Firebase $e");
  }
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PanierProvider())],
      child: EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => HomePage(),
        "listProduit": (context) => ProduitListPage(),
        "detailProduit": (context) => ProduitDetailPage(),
        "panier": (context) => PanierPage(),
        "favorite": (context) => FavoritePage(),
        "profile": (context) => UserInfoPage(),
        "meteo": (context) => MeteoScreen(),
        "barreNavigation": (context) => BarreNavigationScreen(),
      },
      initialRoute: "barreNavigation",
      //  home: BarreNavigationScreen()
      //HomePage()
    );
  }
}
//Exemple
// Future <void > getData() async{
// //
//  await XXXXX
// //
// }

/*
 SGBD : MAngoDB, Mysql,....
 //USER 
 Connectitivie=> connect(@ip,nom_bd,username,pwd);

 Nombd !!!!! ( default)
 user name !!!
 pssword
 ----------
 APPLICATION : OS:IOS,ANdroid, WEB, Windiows....
 FLUTTER => GOOGLE, FIREBASE

*/
