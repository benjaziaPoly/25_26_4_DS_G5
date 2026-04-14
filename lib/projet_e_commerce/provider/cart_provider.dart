import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit_panier.dart';

class PanierProvider with ChangeNotifier {
  //attribut Priavte
  List<ProduitPanier> _panier = [];
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
}
