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
        child: Container(child: Text("welcome to my App $days $name")),
      ),
      drawer: MyDrawer(),
    );
  }
}
