import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_delivery/pages/menu_page/menu_type_page.dart';
import 'package:project_delivery/providers/menu.dart';
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
  List<int> _searchIndexList = [];

  Widget _searchTextField(List<String> list) {
    return TextField(
      onChanged: (String s) {
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < list.length; i++) {
            if (list[i].contains(s)) {
              _searchIndexList.add(i);
            }
          }
        });
      },
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
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView(List<String> list) {
    return ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: (ctx, index) {
          index = _searchIndexList[index];
          return ListTile(title: Text(list[index]));
        });
  }

  @override
  Widget build(BuildContext context) {
    final typesList = Provider.of<Menu>(context).types;

    return Scaffold(
      appBar: AppBar(
          title: !_searchBoolean
              ? const Text('Ваше Заведение')
              : _searchTextField(typesList),
          actions: !_searchBoolean
              ? [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = true;
                          _searchIndexList = [];
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
          ? _searchListView(typesList)
          : TypeMenuListItem(list: typesList),
    );
  }
}

class TypeMenuListItem extends StatelessWidget {
  const TypeMenuListItem({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Text(
                    LocaleKeys.menuShops.tr(),
                    style: TextStyle(fontSize: 20),
                  )),
            );
          } else {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MenuTypePage(menuType: list[index - 1]),
              )),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Various_sushi%2C_beautiful_October_night_at_midnight.jpg/1280px-Various_sushi%2C_beautiful_October_night_at_midnight.jpg',
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
                          list[index - 1],
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
