import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("My first Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
          Center(
            child: Text(
              "DS G5",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
        ],
      ),
    ),
  );
  runApp(myApp);
}
