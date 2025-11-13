import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_catalog/core/cart.dart';
import 'package:flutter_catalog/core/home.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/pages/home/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/pages/home/home_widgets/catalog_list_and_item.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "SohAil Mobile App Developer";

  @override
  void initState() {
    super.initState();
    // Load data once when the page is created
    Future.microtask(
      () => Provider.of<HomeViewModel>(context, listen: false).loadData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("Rebuld Home page complee");
    // final cart = Provider.of<CartModel>(context);
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: Consumer<CartModel>(
        builder: (context, value, child) {
          // print("floatting count rebuild only");
          return Badge(
            badgeContent: Text(
              value.items.length.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(CupertinoIcons.cart, color: Colors.white),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CatalogList(items: homeViewModel.items),
                  ),
                )
              else
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
