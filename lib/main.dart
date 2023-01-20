import 'package:flutter/material.dart';
import 'package:project_delivery/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import './bloc/cart_bloc.dart';
import './pages/my_home_page.dart';

import 'package:easy_localization/easy_localization.dart';

import 'generated/codegen_loader.g.dart';

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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
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
      child: Text(
        LocaleKeys.menu.tr(),
      ),
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
