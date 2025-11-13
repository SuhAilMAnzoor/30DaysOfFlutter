import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/cart.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = Provider.of<CartModel>(context);
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          cart.add(catalog);
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
