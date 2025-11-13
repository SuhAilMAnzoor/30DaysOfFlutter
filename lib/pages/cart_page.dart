import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build complete widget");
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<CartModel>(
            builder: (context, value, child) {
              // rebuild this specfic part of UI
              print("Only rebuild the total price widget");
              return Text(
                "\$${value.totalPrice}",
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),
          SizedBox(width: 30),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Buying not Supported yet")),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Text(
                "Buy",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel cart = Provider.of<CartModel>(context);
    return cart.items.isEmpty
        ? Center(
            child: Text(
              "Buy items from the home page it's Empty!",
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: Theme.of(context).iconTheme.color,
              ),
              trailing: IconButton(
                onPressed: () => cart.remove(cart.items[index]),
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              title: Text(
                cart.items[index].name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
  }
}
