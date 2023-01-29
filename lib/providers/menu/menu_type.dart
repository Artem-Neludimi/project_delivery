import 'package:flutter/material.dart';

class MenuTypeItem {
  final String title;
  final String imageURL;

  MenuTypeItem({required this.title, required this.imageURL});
}

class MenuType with ChangeNotifier {
  List<MenuTypeItem> _types = [
    MenuTypeItem(
      title: 'Суши',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Пицца',
      imageURL:
          'https://omnomnom.dp.ua/image/cache/catalog/pizza_new/new/img_0692-500x500.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 3',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 4',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 5',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 6',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 7',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 8',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 9',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
    MenuTypeItem(
      title: 'Тип 10',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
    ),
  ];

  List<MenuTypeItem> get types {
    return [..._types];
  }
}
