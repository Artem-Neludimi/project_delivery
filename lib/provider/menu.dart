import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final double price;
  final int weight;
  final Image image;
  final int quantity;
  final bool isFavorite;
  final String description;
  final List<bool> modifications;

  MenuItem({
    required this.id,
    required this.title,
    required this.price,
    required this.weight,
    required this.image,
    required this.quantity,
    required this.isFavorite,
    required this.description,
    required this.modifications,
  });
}

class Menu with ChangeNotifier {
  Map<String, MenuItem> _items = {};

  Map<String, MenuItem> get items {
    return {..._items};
  }

  int? get itemCount {
    _items.length;
  }
}
