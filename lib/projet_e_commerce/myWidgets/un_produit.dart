import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

class WidgetProduit extends StatefulWidget {
  final p = Produit(
    id: "",
    description: "",
    price: 0,
    imageUrl: "",
    brand: "",
    quantity: 0,
    title: "",
    produitCategoryName: "",
  );
  WidgetProduit({super.key});
  @override
  _WidgetProduitState createState() => _WidgetProduitState();
}

class _WidgetProduitState extends State<WidgetProduit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 240,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                widget.p.imageUrl,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.38,
                fit: BoxFit.cover,
              ),
            ),
            Badge(
              label: Text('New', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.p.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.p.price} tnd',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Quantité : ${widget.p.quantity}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
