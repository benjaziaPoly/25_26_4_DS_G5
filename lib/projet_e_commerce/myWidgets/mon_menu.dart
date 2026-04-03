import 'package:flutter/material.dart';

class MonMenu extends StatefulWidget {
  const MonMenu({super.key});

  @override
  State<MonMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MonMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("BenJazia"),
            accountEmail: Text("@gmai.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png",
              ),
            ),
          ),

          ListTile(
            title: Text("Acceuil"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, "home");
            },
          ),
          ListTile(
            title: Text("Liste Produit"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.pushNamed(context, "listProduit");
            },
          ),
          ListTile(
            title: Text("Panier"),
            leading: Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.pushNamed(context, "panier");
            },
          ),
          ListTile(
            title: Text("Favorite"),
            leading: Icon(Icons.favorite),
            onTap: () {
              Navigator.pushNamed(context, "favorite");
            },
          ),
          ListTile(
            title: Text("Mon Profil"),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pushNamed(context, "profile");
            },
          ),
        ],
      ),
    );
  }
}
