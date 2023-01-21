import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.menu.tr(),
      ),
    );
  }
}
