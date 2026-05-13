import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';
import 'package:projet/projet_e_commerce/myWidgets/un_produit.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';
import 'package:projet/projet_e_commerce/service/firebase_crud.dart';

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
  var fbc = FireBaseCrud();
  List<Produit> myproducts = [];
  dynamic tmp;
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      tmp = await fbc.readData(); //GET From FIrebase
      print("data from Firebase");

      setState(() {
        myproducts = tmp;
      });
    } catch (e) {
      print("erreur $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Produit "),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Container(
              width: double.infinity,
              color: Colors.amber,
              child: Center(child: CircularProgressIndicator()),
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.4,
              children: List.generate(myproducts.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "detailProduit",
                      arguments: index,
                    );
                    // ProduitDetailPage(produit: AllProductData.Produits[index]);
                  },
                  child: WidgetProduit(p: myproducts[index]),
                );
              }),
            ),
    );
  }
}
