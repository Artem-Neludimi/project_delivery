import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import './generated/locale_keys.g.dart';
import './generated/codegen_loader.g.dart';
import './pages/menu_page.dart';
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
        supportedLocales: [
          Locale('en'),
          Locale('ru'),
          Locale('ua'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopping Cart Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        listTileTheme:
            ListTileThemeData(iconColor: Colors.grey, textColor: Colors.white),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(232, 20, 20, 20),
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: ButtonTabs(),
    );
  }
}

class ButtonTabs extends StatefulWidget {
  const ButtonTabs({super.key});

  @override
  State<ButtonTabs> createState() => _ButtonTabsState();
}

class _ButtonTabsState extends State<ButtonTabs> {
  int _tabIndex = 0;
  final tabs = [
    MenuPage(),
    NewsPage(),
    QrCodePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: tabs[_tabIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromRGBO(63, 63, 63, 1),
          ),
          child: BottomNavigationBar(
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                label: LocaleKeys.menu.tr(),
                icon: Icon(Icons.dining_outlined),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.news.tr(),
                icon: Icon(Icons.newspaper),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.qrCode.tr(),
                icon: Icon(Icons.qr_code),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.more.tr(),
                icon: Icon(Icons.person_outline),
              )
            ],
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ),
      );
}
