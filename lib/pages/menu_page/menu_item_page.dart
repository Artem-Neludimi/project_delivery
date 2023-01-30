import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:project_delivery/widgets/add_or_remove_from_cart.dart';
import 'package:provider/provider.dart';

import '../../providers/menu/menu_favorites.dart';
import '../../widgets/info_and_like_buttons.dart';
import '../../providers/menu/menu.dart';

class MenuItemPage extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemPage({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            menuItem.title,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Expanded(
              child: Image.network(
                menuItem.imageURL,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${menuItem.weight}г',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Dash(
                        dashColor: Colors.grey,
                        length: 25,
                        direction: Axis.vertical,
                      ),
                      Text(
                        '${menuItem.quantity} шт.',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                InfoAndLikeButtons(
                  menuItem: menuItem,
                )
              ],
            ),
          ),
          Dash(
            dashColor: Colors.grey,
            length: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      menuItem.oldPrice != null
                          ? Text(
                              '${menuItem.oldPrice} ${String.fromCharCode(0x20B4)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        '${menuItem.price} ${String.fromCharCode(0x20B4)}',
                        style: const TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
                AddOrRemoveFromCart(menuItem: menuItem),
              ],
            ),
          ),
          Dash(
            dashColor: Colors.grey,
            length: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Text(
              menuItem.ingredients,
              style: const TextStyle(fontSize: 25, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
