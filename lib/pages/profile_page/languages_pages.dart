import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagesPages extends StatelessWidget {
  const LanguagesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lang'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('English'),
            trailing: Icon(Icons.done),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: Color.fromRGBO(75, 75, 75, 1),
              height: 5,
            ),
          ),
          InkWell(
            onTap: () => context.setLocale(Locale('ru')),
            child: ListTile(
              title: const Text('Русский'),
              trailing: Icon(Icons.done),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: Color.fromRGBO(75, 75, 75, 1),
              height: 5,
            ),
          ),
          ListTile(
            title: Text('Українська'),
            trailing: Icon(Icons.done),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: Color.fromRGBO(75, 75, 75, 1),
              height: 5,
            ),
          ),
        ],
      ),
    );
  }
}
