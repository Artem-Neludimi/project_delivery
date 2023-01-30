import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:project_delivery/pages/menu_page/menu_item_page.dart';
import 'package:project_delivery/providers/menu/menu_favorites.dart';
import 'package:provider/provider.dart';

import '../providers/menu/menu.dart';
import 'add_or_remove_from_cart.dart';
import 'info_and_like_buttons.dart';

class ListMenuItems extends StatelessWidget {
  const ListMenuItems({
    super.key,
    required this.menuItems,
  });

  final List<MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (_, index) {
        const textStyle = TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        );
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MenuItemPage(menuItem: menuItems[index]),
                ),
              ),
              child: SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.network(
                      menuItems[index].imageURL,
                      height: 140,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 100,
                      left: 110,
                      top: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuItems[index].title,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InfoAndLikeButtons(
                        menuItem: menuItems[index],
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 110,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuItems[index].ingredients,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
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
                          const Dash(
                            direction: Axis.vertical,
                            dashColor: Color.fromARGB(255, 82, 82, 82),
                            length: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${menuItems[index].weight}г',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Dash(
                        dashColor: const Color.fromARGB(255, 82, 82, 82),
                        length: MediaQuery.of(context).size.width,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: AddOrRemoveFromCart(menuItem: menuItems[index]),
            ),
          ],
        );
      },
    );
  }
}
