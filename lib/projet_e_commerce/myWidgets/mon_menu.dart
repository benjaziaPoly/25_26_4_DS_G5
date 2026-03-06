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
        ],
      ),
    );
  }
}
