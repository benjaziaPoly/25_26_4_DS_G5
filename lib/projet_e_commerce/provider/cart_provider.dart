import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit_panier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierProvider with ChangeNotifier {
  //attribut Priavte
  List<ProduitPanier> _panier = [];

  PanierProvider() {
    getCart();
  }
  // Ajouter GET UNIQUEMENT
  List<ProduitPanier> get Panier {
    return _panier;
  }

  void ajouterProduit(ProduitPanier nouveauProduit) {
    ProduitPanier? produitTrouve = _panier.firstWhere(
      (art) {
        if (art.id == nouveauProduit.id) {
          art.quantite += 1;
          return true;
        }
        return false;
      },
      orElse: () {
        print("Ajout new produit :" + nouveauProduit.id.toString());

        final p = ProduitPanier(
          id: nouveauProduit.id,
          title: nouveauProduit.title,
          description: nouveauProduit.description,
          price: nouveauProduit.price,
          imageUrl: nouveauProduit.imageUrl,
          quantite: 1,
        );
        _panier.add(p);
        return p;
      },
    );
    ////IMPORTANT
    notifyListeners();
  }

  Future<void> saveCart() async {
    //localStrorage
    // SharedPreferences
    final SharedPreferences data = await SharedPreferences.getInstance();
    //_panier List ProdutPanier
    // _panier => JSON => STring
    final List<String> xx = _panier.map((item) => item.toJson()).toList();
    await data.setString("cartSaved", json.encode(xx)); //ecriture
  }

  Future<void> getCart() async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    String? valeur = await data.getString("cartSaved");
    if (valeur == null) {
      _panier = [];
    } else {
      List<dynamic> listMap = json.decode(valeur);

      _panier = listMap.map((item) => ProduitPanier.fromJson(item)).toList();
    }

    notifyListeners();
  }
}
// key:value
   // object  {
   //}
   // array : [     ]
   // format josn ==> UNE CHAINE Formatté : 