import 'package:flutter/material.dart';
import 'package:project_delivery/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import './providers/menu.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Shopping Cart Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
          canvasColor: Colors.black,
          hintColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
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
