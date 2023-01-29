import 'package:flutter/material.dart';
import 'package:project_delivery/pages/cart_page.dart';
import 'package:project_delivery/providers/cart/cart.dart';
import 'package:project_delivery/providers/menu/menu_favorites.dart';
import 'package:project_delivery/providers/menu/menu_type.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'providers/menu/menu.dart';
import './generated/locale_keys.g.dart';
import './generated/codegen_loader.g.dart';
import './pages/menu_page/menu_page.dart';
import './pages/news_page.dart';
import './pages/profile_page/profile_page.dart';
import './pages/qr_code.dart';

// flutter pub run easy_localization:generate -S "assets/translations"
// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (c) => Menu(),
        ),
        ChangeNotifierProvider(
          create: (c) => MenuType(),
        ),
        ChangeNotifierProvider(
          create: (c) => MenuFavorites(),
        ),
        ChangeNotifierProvider(
          create: (c) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Shopping Cart Demo',
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.black,
          accentColor: Colors.white,
          canvasColor: Colors.black,
          hintColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            displayLarge: TextStyle(color: Colors.white),
            displayMedium: TextStyle(color: Colors.black, fontSize: 16),
            displaySmall: TextStyle(color: Colors.white),
            headlineMedium: TextStyle(color: Colors.white),
            headlineSmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.grey,
            textColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(63, 63, 63, 1),
            centerTitle: true,
          ),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: BottomTabs(0),
      ),
    );
  }
}

class BottomTabs extends StatefulWidget {
  int tabIndex;

  BottomTabs(this.tabIndex);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  final tabs = [
    const MenuPage(),
    const NewsPage(),
    const QrCodePage(),
    const ProfilePage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: tabs[widget.tabIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromRGBO(63, 63, 63, 1),
          ),
          child: BottomNavigationBar(
            currentIndex: widget.tabIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                label: LocaleKeys.menu.tr(),
                icon: const Icon(Icons.dining_outlined),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.news.tr(),
                icon: const Icon(Icons.newspaper),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.qrCode.tr(),
                icon: const Icon(Icons.qr_code),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.more.tr(),
                icon: const Icon(Icons.person_outline),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.cart.tr(),
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
            onTap: (index) {
              setState(() {
                widget.tabIndex = index;
              });
            },
          ),
        ),
      );
}
