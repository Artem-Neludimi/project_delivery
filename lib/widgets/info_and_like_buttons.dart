import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/locale_keys.g.dart';
import '../providers/menu/menu.dart';
import '../providers/menu/menu_favorites.dart';

class InfoAndLikeButtons extends StatelessWidget {
  final MenuItem menuItem;

  const InfoAndLikeButtons({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (_) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Wrap(
                    children: [
                      Center(
                        child: FractionallySizedBox(
                          widthFactor: .25,
                          child: Container(
                            height: 5.0,
                            margin: const EdgeInsets.only(
                              top: 15,
                              bottom: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          LocaleKeys.energyValue.tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        trailing: Text(
                          menuItem.energyValue == null
                              ? ('0 ккал')
                              : ('${menuItem.energyValue} ккал'),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          LocaleKeys.protein.tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        trailing: Text(
                          menuItem.protein == null
                              ? ('0 г')
                              : ('${menuItem.protein} г'),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          LocaleKeys.fats.tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        trailing: Text(
                          menuItem.fats == null
                              ? ('0 г')
                              : ('${menuItem.fats} г'),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          LocaleKeys.carbohydrates.tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        trailing: Text(
                          menuItem.carbohydrates == null
                              ? ('0 г')
                              : ('${menuItem.carbohydrates} г'),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      SizedBox.square()
                    ],
                  ),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<MenuFavorites>(context, listen: false)
                .toggleFavorites(menuItem);
          },
          icon: Provider.of<MenuFavorites>(context, listen: true)
                  .isFavorite(menuItem)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.orange,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
        ),
      ],
    );
  }
}
