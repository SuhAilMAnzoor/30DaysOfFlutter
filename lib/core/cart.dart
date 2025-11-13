import 'package:flutter/foundation.dart';
import 'package:flutter_catalog/models/catalog_model.dart';

class CartModel extends ChangeNotifier {
  // catalog field
  CatalogModel _catalog = CatalogModel();

  // Collection of IDs - Store Ids of each item
  final List<int> _itemIds = [];

  // get Catalog
  CatalogModel get catalog => _catalog;

  // set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  // Remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }

  // Helper: check if an item is in the cart
  bool isInCart(Item item) => _itemIds.contains(item.id);
}
