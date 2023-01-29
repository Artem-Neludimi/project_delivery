import 'package:flutter/material.dart';
import 'package:project_delivery/providers/menu/menu.dart';
import 'package:provider/provider.dart';

import '../../widgets/list_menu_items.dart';

class MenuTypePage extends StatelessWidget {
  final String menuType;

  const MenuTypePage({super.key, required this.menuType});

  @override
  Widget build(BuildContext context) {
    Provider.of<Menu>(context).clearMenu();
    Provider.of<Menu>(context).specifyMenu(menuType);
    final menuTypeItems = Provider.of<Menu>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(menuType),
      ),
      body: ListMenuItems(menuItems: menuTypeItems),
    );
  }
}
