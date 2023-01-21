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
  "more": "Ще"
};
static const Map<String,dynamic> ru = {
  "language": "Русский",
  "menu": "Меню",
  "news": "Новости",
  "qrCode": "Qr-код",
  "more": "Ещё"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
