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
          InkWell(
            onTap: () {
              context.setLocale(const Locale('ru'));
              Navigator.of(context).pop();
            },
            child: ListTile(
              title: const Text('Русский'),
              trailing: context.locale == const Locale('ru')
                  ? const Icon(Icons.done)
                  : null,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: Color.fromRGBO(75, 75, 75, 1),
              height: 5,
            ),
          ),
          InkWell(
            onTap: () {
              context.setLocale(const Locale('en'));
              Navigator.of(context).pop();
            },
            child: ListTile(
              title: Text('Українська'),
              trailing: context.locale == const Locale('en')
                  ? const Icon(Icons.done)
                  : null,
            ),
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
