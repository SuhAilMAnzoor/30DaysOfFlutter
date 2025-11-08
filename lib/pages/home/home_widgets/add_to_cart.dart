import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart_model.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          setState(() {
            isInCart = !isInCart;
          });
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
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
