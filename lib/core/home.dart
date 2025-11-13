import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLeading = false;
  bool get isLeading => _isLeading;

  List<Item> _items = [];
  List<Item> get items => _items;

  Future<void> loadData() async {
    _isLeading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    _items = List.from(
      productData,
    ).map<Item>((item) => Item.fromMap(item)).toList();

    CatalogModel.items = _items;

    _isLeading = false;
    notifyListeners();
  }
}
