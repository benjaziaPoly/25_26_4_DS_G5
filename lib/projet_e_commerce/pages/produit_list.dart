import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/myWidgets/un_produit.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';

class ProduitListPage extends StatefulWidget {
  const ProduitListPage({super.key});

  @override
  State<ProduitListPage> createState() => _MyWidgetState();
}

/**
 * passage depuis la page ListProduit => DetailProduit
 *  A.
 *     passage via le constructeur de la classe DetailProduit(
 *        Index  
 *        object Produit
 *     )
 *  B. Navigator: arguments
 */
class _MyWidgetState extends State<ProduitListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Produit "),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.4,
        children: List.generate(AllProductData.Produits.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "detailProduit", arguments: index);
              // ProduitDetailPage(produit: AllProductData.Produits[index]);
            },
            child: WidgetProduit(p: AllProductData.Produits[index]),
          );
        }),
      ),
    );
  }
}
