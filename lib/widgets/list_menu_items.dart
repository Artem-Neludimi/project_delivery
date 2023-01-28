import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:project_delivery/pages/menu_page/menu_item_page.dart';
import 'package:project_delivery/providers/menu_favorites.dart';
import 'package:provider/provider.dart';

import '../providers/menu.dart';
import 'add_or_remove_from_cart.dart';
import 'info_and_like_buttons.dart';

class ListMenuItems extends StatelessWidget {
  const ListMenuItems({
    super.key,
    required this.menuTypeItems,
  });

  final List<MenuItem> menuTypeItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuTypeItems.length,
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
                  builder: (_) => MenuItemPage(menuItem: menuTypeItems[index]),
                ),
              ),
              child: SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.network(
                      menuTypeItems[index].imageURL,
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
                            menuTypeItems[index].title,
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
                        menuItem: menuTypeItems[index],
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
                            menuTypeItems[index].ingredients,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                            maxLines: 2,
                          ),
                          menuTypeItems[index].quantity == 1
                              ? const SizedBox.shrink()
                              : Text(
                                  '${menuTypeItems[index].quantity} шт',
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
                          menuTypeItems[index].oldPrice == null
                              ? const SizedBox.shrink()
                              : Text(
                                  '${menuTypeItems[index].oldPrice} ${String.fromCharCode(0x20B4)}',
                                  style: textStyle,
                                ),
                          Text(
                            '${menuTypeItems[index].price} ${String.fromCharCode(0x20B4)}',
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
                            '${menuTypeItems[index].weight}г',
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
            const Positioned(
              right: 10,
              bottom: 10,
              child: AddOrRemoveFromCart(),
            ),
          ],
        );
      },
    );
  }
}
