import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "SohAil Mobile App Developer";

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Center(
        child: Container(child: Text("welcome to my App $days $name")),
      ),
      drawer: Drawer(),
    );
  }
}
