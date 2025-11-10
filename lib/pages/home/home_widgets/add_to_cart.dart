import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart_model.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.primary
              : MyTheme.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart
          ? Icon(Icons.done, color: Colors.white)
          : Icon(CupertinoIcons.shopping_cart, color: Colors.white),
    );
  }
}
