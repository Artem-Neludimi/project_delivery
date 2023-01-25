import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:project_delivery/providers/menu.dart';
import 'package:provider/provider.dart';

class MenuTypePage extends StatelessWidget {
  final String menuType;

  const MenuTypePage({super.key, required this.menuType});

  @override
  Widget build(BuildContext context) {
    Provider.of<Menu>(context).clearMenu();
    Provider.of<Menu>(context).specifyMenu(menuType);
    final menuItems = Provider.of<Menu>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(menuType),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          const textStyle = TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          );
          return Stack(
            children: [
              Positioned(
                child: Image.network(
                  menuItems[index].imageURL,
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 110,
                top: 10,
                child: Text(
                  menuItems[index].title,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 45,
                left: 110,
                child: Container(
                  width: MediaQuery.of(context).size.width - 130,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItems[index].ingredients,
                        overflow: TextOverflow.fade,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                        maxLines: 2,
                      ),
                      menuItems[index].quantity == 1
                          ? const SizedBox.shrink()
                          : Text(
                              '${menuItems[index].quantity} шт',
                              style: const TextStyle(color: Colors.grey),
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 110,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuItems[index].oldPrice == null
                        ? const SizedBox.shrink()
                        : Text(
                            '${menuItems[index].oldPrice} ${String.fromCharCode(0x20B4)}',
                            style: textStyle,
                          ),
                    Text(
                      '${menuItems[index].price} ${String.fromCharCode(0x20B4)}',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 170,
                bottom: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Dash(
                      direction: Axis.vertical,
                      dashColor: Color.fromARGB(255, 82, 82, 82),
                      length: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${menuItems[index].weight}г',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                      Text(
                        '0',
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                      Text(
                        '+',
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Dash(
                  dashColor: Color.fromARGB(255, 82, 82, 82),
                  length: MediaQuery.of(context).size.width,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
