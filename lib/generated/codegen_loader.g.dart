// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "language": "Українська",
  "menu": "Меню",
  "news": "Новини",
  "qrCode": "Qr-код",
  "more": "Ще",
  "editProfile": "Редагувати профіль",
  "favorite": "Обрані товари",
  "historyOrders": "Історія замовлень",
  "commentUs": "Залишити відгук",
  "pushNot": "Push-повідомлення",
  "languages": "Мова",
  "logOut": "Вихід",
  "deleteAcc": "Видалити акаунт",
  "youHaventFavorites": "У вас немає обраних товарів",
  "youHaventOrders": "У вас ще немає замовлень",
  "menuShops": "Меню магазина"
};
static const Map<String,dynamic> ru = {
  "language": "Русский",
  "menu": "Меню",
  "news": "Новости",
  "qrCode": "Qr-код",
  "more": "Ещё",
  "editProfile": "Редактировать профиль",
  "favorite": "Избранное",
  "historyOrders": "История Заказов",
  "commentUs": "Оставить отзыв",
  "pushNot": "Push-уведомления",
  "languages": "Язык",
  "logOut": "Выход",
  "deleteAcc": "Удалить аккаунт",
  "youHaventFavorites": "У вас нет избранных товаров",
  "youHaventOrders": "У вас ещё нет заказов",
  "menuShops": "Меню магазина"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
