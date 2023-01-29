import 'package:flutter/material.dart';

import '../menu/menu.dart';

class CartItem {
  final String id;
  final List<MenuItem> purchases;

  CartItem({
    required this.id,
    required this.purchases,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  void addToCart(MenuItem menuItem) {
    if (_items.isEmpty) {
      _items.add(
        CartItem(
          id: DateTime.now().toString(),
          purchases: [menuItem],
        ),
      );
    } else {
      _items.last.purchases.add(menuItem);
    }
    notifyListeners();
  }

  void deleteFromCart(MenuItem menuItem) {
    if (_items.isNotEmpty &&
        _items.last.purchases.isNotEmpty &&
        _items.last.purchases.contains(menuItem)) {
      _items.last.purchases.removeLast();
    }
    notifyListeners();
  }

  String theSameProductQuantity(MenuItem menuItem) {
    if (_items.isNotEmpty &&
        _items.last.purchases.isNotEmpty &&
        _items.last.purchases.contains(menuItem)) {
      var productQuantity = 0;
      for (int i = 0; i < _items.last.purchases.length; i++) {
        if (_items.last.purchases[i] == menuItem) {
          productQuantity++;
        }
      }
      return productQuantity.toString();
    } else {
      return '0';
    }
  }
}
