import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "SohAil Mobile App Developer";

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App"), centerTitle: true),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: Colors.green,
          child: Container(height: 100, width: 100, color: Colors.red),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
