import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_delivery/pages/menu_page/menu_item_page.dart';
import 'package:project_delivery/pages/menu_page/menu_type_page.dart';
import 'package:project_delivery/providers/menu/menu.dart';
import 'package:project_delivery/providers/menu/menu_type.dart';
import 'package:provider/provider.dart';

import '../../generated/locale_keys.g.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _searchBoolean = false;
  List<int> searchIndexList = [];

  Widget _searchTextField(List<String> list) {
    return TextField(
      onChanged: (String s) {
        setState(() {
          searchIndexList = [];
          for (int i = 0; i < list.length; i++) {
            if (list[i].contains(s)) {
              searchIndexList.add(i);
            }
          }
        });
      },
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      style: const TextStyle(
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final typesList = Provider.of<MenuType>(context)
        .types
        .map((elements) => elements.title)
        .toList();
    final imagesList = Provider.of<MenuType>(context)
        .types
        .map((elements) => elements.imageURL)
        .toList();
    final allItemsList = Provider.of<Menu>(context).allItems;
    final allItemsListTitle =
        allItemsList.map((elements) => elements.title).toList();

    return Scaffold(
      appBar: AppBar(
          title: !_searchBoolean
              ? const Text('Ваше Заведение')
              : _searchTextField(allItemsListTitle),
          actions: !_searchBoolean
              ? [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = true;
                          searchIndexList = [];
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      })
                ]),
      body: _searchBoolean
          ? SearchListView(
              searchIndexList: searchIndexList, allItemsList: allItemsList)
          : TypeMenuItemList(
              typesList: typesList,
              imagesList: imagesList,
            ),
    );
  }
}

class SearchListView extends StatelessWidget {
  final List<int> searchIndexList;
  final List<MenuItem> allItemsList;

  const SearchListView({
    super.key,
    required this.searchIndexList,
    required this.allItemsList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchIndexList.length,
        itemBuilder: (ctx, index) {
          index = searchIndexList[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MenuItemPage(
                      menuItem: allItemsList[index],
                    ))),
            child: ListTile(
              title: Text(allItemsList[index].title),
              trailing: Image.network(allItemsList[index].imageURL),
            ),
          );
        });
  }
}

class TypeMenuItemList extends StatelessWidget {
  final List<String> typesList;
  final List<String> imagesList;
  const TypeMenuItemList({
    Key? key,
    required this.typesList,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: typesList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.menuShops.tr(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ));
          } else {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MenuTypePage(menuType: typesList[index - 1]),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imagesList[index - 1],
                        fit: BoxFit.cover,
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        width: 150,
                        child: Text(
                          typesList[index - 1],
                          overflow: TextOverflow.fade,
                        ),
                      )),
                ],
              ),
            );
          }
        });
  }
}
