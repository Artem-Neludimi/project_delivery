import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './bloc/cart_bloc.dart';
import './pages/my_home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ru'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
        create: (context) => CartBloc(),
        child: MaterialApp(
          title: 'Flutter Shopping Cart Demo',
          theme: ThemeData(
            canvasColor: Colors.black,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
                .copyWith(secondary: Colors.amber),
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.white),
            ),
          ),
          home: ButtonTabs(),
        ));
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
    Center(
      child: Text('Menu'),
    ),
    Center(
      child: Text('News'),
    ),
    Center(
      child: Text('Qr-code'),
    ),
    Center(
      child: Text('More'),
    ),
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
                label: "Menu",
                icon: Icon(Icons.dining_outlined),
              ),
              BottomNavigationBarItem(
                label: 'News',
                icon: Icon(Icons.newspaper),
              ),
              BottomNavigationBarItem(
                label: 'Qr-code',
                icon: Icon(Icons.qr_code),
              ),
              BottomNavigationBarItem(
                label: 'More',
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
