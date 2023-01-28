import 'package:flutter/material.dart';
import 'package:project_delivery/providers/menu.dart';

class MenuFavorites with ChangeNotifier {
  List<MenuItem> _items = [];

  List<MenuItem> get favorites {
    return [..._items];
  }

  void toggleFavorites(MenuItem item) {
    if (isFavorite(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(MenuItem item) {
    return _items.contains(item);
  }

  bool isEmptyFavorite() {
    return _items.isEmpty;
  }
}
