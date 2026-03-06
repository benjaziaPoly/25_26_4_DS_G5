import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

class ProduitDetailPage extends StatefulWidget {
  Produit produit = Produit(
    id: "",
    title: "",
    description: "",
    brand: "",
    produitCategoryName: "",
    price: 0,
    quantity: 0,
    imageUrl: "",
  );

  ProduitDetailPage({super.key, required this.produit});

  @override
  State<ProduitDetailPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProduitDetailPage> {
  @override
  Widget build(BuildContext context) {
    final productInfo = widget.produit;

    return Scaffold(
      appBar: AppBar(title: Text(productInfo.title)),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(productInfo.imageUrl),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 250.0),
                Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "PRIX:" + productInfo.price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      infoProduct("Brand", productInfo.brand),
                      infoProduct("Quantity", productInfo.quantity.toString()),
                      infoProduct("Category", productInfo.produitCategoryName),
                    ],
                  ),
                ),
                //bouton en ba
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoProduct(String titre, String value) {
    return Row(children: [Text(titre), Text(value)]);
  }
}
