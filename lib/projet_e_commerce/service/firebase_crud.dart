import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

class FireBaseCrud {
  Future<void> savedata(List<Produit> listep) async {
    //save data from locael file list_prouit
    //=> firebase
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();
    for (var produit in listep) {
      DocumentReference docRef = firestore.collection('produits').doc();
      batch.set(docRef, produit.toMap());
    }
    try {
      await batch.commit();
      print("Data saved : ${listep.length} Products!!!");
    } catch (e) {
      print("Error dectected");
    }

    //Trnasactionnel : commit, rollback
  }

  //flutter pub add cloud_firestore
  Future<List<Produit>> readData() async {

    List<Produit> result = [];
    
    final CollectionReference collectionProduits = FirebaseFirestore.instance
        .collection('produits');

    QuerySnapshot snapshot = await collectionProduits.get();
    for (var prod in snapshot.docs) {
      result.add(
        Produit.fromMap({
          "id": prod['id'] ?? '',
          "title": prod['title'] ?? '',
          "description": prod['description'] ?? '',
          "price": prod['price']?.toDouble() ?? 0.0,
          "imageUrl": prod['imageUrl'] ?? '',
          "brand": prod['brand'] ?? '',
          "produitCategoryName": prod['produitCategoryName'] ?? '',
          "quantity": prod['quantity']?.toInt() ?? 0,
        }),
      );
    }
    return result;
  }
}
