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
  List<CartItem> _items = [
    CartItem(
      id: DateTime.now().toString(),
      purchases: [],
    )
  ];

  Set<MenuItem> get productsInCart {
    return {..._items.last.purchases};
  }

  void addToCart(MenuItem menuItem) {
    _items.last.purchases.add(menuItem);
    notifyListeners();
  }

  void deleteFromCart(MenuItem menuItem) {
    if (_items.last.purchases.contains(menuItem)) {
      _items.last.purchases.remove(menuItem);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.last.purchases.clear();
    notifyListeners();
  }

  int theSameProductQuantity(MenuItem menuItem) {
    var productQuantity = 0;
    if (_items.last.purchases.contains(menuItem)) {
      for (int i = 0; i < _items.last.purchases.length; i++) {
        if (_items.last.purchases[i] == menuItem) {
          productQuantity++;
        }
      }
    }
    return productQuantity;
  }
}
