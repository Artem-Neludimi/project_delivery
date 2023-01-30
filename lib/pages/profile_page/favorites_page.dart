import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_delivery/providers/menu/menu_favorites.dart';
import 'package:provider/provider.dart';

import '../../generated/locale_keys.g.dart';
import '../../providers/menu/menu.dart';
import '../../widgets/list_menu_items.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.favorite.tr()),
        ),
        body: Provider.of<MenuFavorites>(context, listen: false)
                .isEmptyFavorite()
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_fz6xe55o.json',
                        height: 100),
                    Text(
                      LocaleKeys.youHaventFavorites.tr(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            : ListMenuItems(
                menuItems: Provider.of<MenuFavorites>(context, listen: false)
                    .favorites));
  }
}
