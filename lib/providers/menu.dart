import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final num price;
  final num? oldPrice;
  final int weight;
  final String ingredients;
  final String type;
  final String imageURL;
  final int quantity;
  final int? energyValue;
  final int? protein;
  final int? fats;
  final int? carbohydrates;

  MenuItem({
    required this.id,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.weight,
    required this.ingredients,
    required this.type,
    required this.imageURL,
    required this.quantity,
    this.energyValue,
    this.protein,
    this.fats,
    this.carbohydrates,
  });
}

class Menu with ChangeNotifier {
  // ignore: prefer_final_fields
  List<MenuItem> _items = [
    MenuItem(
      id: 'm1',
      title: 'Пицца',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба.',
      type: 'Пицца',
      imageURL:
          'https://omnomnom.dp.ua/image/cache/catalog/pizza_new/new/img_0692-500x500.jpg',
      quantity: 1,
      energyValue: 1000,
    ),
    MenuItem(
      id: 'm2',
      title: 'Суши',
      price: 100,
      oldPrice: 300,
      weight: 400,
      ingredients: 'рыба, рыба, рыба, рыба, рыба.',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 10,
    ),
    MenuItem(
      id: 'm3',
      title: 'Авторский горячий рол око дракона',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
    ),
    MenuItem(
      id: 'm4',
      title: 'Суши',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
    ),
    MenuItem(
      id: 'm5',
      title: 'Суши',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 8,
    ),
    MenuItem(
      id: 'm6',
      title: 'Суши',
      price: 100,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 8,
    ),
    MenuItem(
      id: 'm7',
      title: 'Суши',
      price: 100,
      oldPrice: null,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Item 1',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 10,
    ),
    MenuItem(
      id: 'm8',
      title: 'Суши',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
    ),
    MenuItem(
      id: 'm9',
      title: 'Суши',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
    ),
    MenuItem(
      id: 'm10',
      title: 'Суши',
      price: 100,
      oldPrice: 200,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
    ),
  ];

  List<MenuItem> items = [];

  List<MenuItem> get allItems {
    return [..._items];
  }

  void specifyMenu(String type) {
    for (var i = 0; i < _items.length - 1; i++) {
      if (_items[i].type == type) {
        items.add(_items[i]);
      }
    }
    notifyListeners();
  }

  void clearMenu() {
    items = [];
    notifyListeners();
  }
}
