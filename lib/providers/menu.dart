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
  final bool isFavorite;
  final List<bool> modifications;

  MenuItem({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.weight,
    required this.ingredients,
    required this.type,
    required this.imageURL,
    required this.quantity,
    required this.isFavorite,
    required this.modifications,
  });
}

class Menu with ChangeNotifier {
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
      isFavorite: false,
      modifications: [false],
    ),
    MenuItem(
      id: 'm2',
      title: 'Суши',
      price: 100,
      oldPrice: null,
      weight: 400,
      ingredients: 'рыба, рыба, рыба, рыба, рыба.',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 1,
      isFavorite: false,
      modifications: [false],
    ),
    MenuItem(
      id: 'm3',
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
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
    ),
    MenuItem(
      id: 'm6',
      title: 'Суши',
      price: 100,
      oldPrice: null,
      weight: 400,
      ingredients:
          'рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, рыба, ',
      type: 'Суши',
      imageURL:
          'https://vkusno-dom.com/wp-content/uploads/2020/11/img_8989-2-1024x1024.jpg',
      quantity: 8,
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
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
      isFavorite: false,
      modifications: [false],
    ),
  ];
  List<String> _types = [
    'Суши',
    'Пицца',
    'type 3',
    'type 4',
    'type 5',
    'type 6',
    'type 7',
    'type 8',
    'type 9',
    'type 10',
  ];

  List<MenuItem> get items {
    return [..._items];
  }

  List<String> get types {
    return [..._types];
  }

  int? get itemCount {
    _items.length;
  }
}
