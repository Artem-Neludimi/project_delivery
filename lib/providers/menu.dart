import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final double price;
  final int weight;
  final String type;
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
    required this.type,
    required this.image,
    required this.quantity,
    required this.isFavorite,
    required this.description,
    required this.modifications,
  });
}

class Menu with ChangeNotifier {
  Map<String, MenuItem> _items = {};
  List<String> _types = [
    'type 1',
    'type 2',
    'type 3',
    'type 4',
    'type 5',
    'type 6',
    'type 7',
    'type 8',
    'type 9',
    'type 10',
  ];

  Map<String, MenuItem> get items {
    return {..._items};
  }

  List<String> get types {
    return [..._types];
  }

  int? get itemCount {
    _items.length;
  }
}
