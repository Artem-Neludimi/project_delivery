import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:lottie/lottie.dart';
import 'package:project_delivery/main.dart';
import 'package:provider/provider.dart';

import '../../generated/locale_keys.g.dart';
import '../../providers/cart/cart.dart';
import '../../providers/menu/menu.dart';
import '../../widgets/add_or_remove_from_cart.dart';
import '../../widgets/info_and_like_buttons.dart';
import '../menu_page/menu_item_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.cart.tr()),
        actions: [
          Provider.of<Cart>(context, listen: false).productsInCart.isEmpty
              ? SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              LocaleKeys.deleteProducts.tr(),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            content: Text(
                              "Saved successfully",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            actions: [
                              ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.orange),
                                onPressed: () {
                                  Provider.of<Cart>(context, listen: false)
                                      .clearCart();
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => BottomTabs(0)));
                                },
                                child: Text(LocaleKeys.delete),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(LocaleKeys.cancel),
                              )
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.orange,
                  ),
                ),
        ],
      ),
      body: Provider.of<Cart>(context, listen: false).productsInCart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_fzoupjne.json',
                      height: 100),
                  Text(
                    LocaleKeys.youHaventOrders.tr(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListOrderItems(
                    menuItems: Provider.of<Cart>(context, listen: false)
                        .productsInCart
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromRGBO(63, 63, 63, 1),
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 7),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(LocaleKeys.makeAnOrder.tr()),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class ListOrderItems extends StatelessWidget {
  const ListOrderItems({
    super.key,
    required this.menuItems,
  });

  final List<MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (_, index) {
        var productQuantity =
            Provider.of<Cart>(context).theSameProductQuantity(menuItems[index]);
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
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.network(
                      menuItems[index].imageURL,
                      height: 70,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 80,
                      left: 55,
                      top: 10,
                      child: Text(
                        menuItems[index].title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 55,
                      bottom: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${menuItems[index].price} ${String.fromCharCode(0x20B4)}',
                            style: const TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Dash(
                            direction: Axis.vertical,
                            dashColor: Color.fromARGB(255, 82, 82, 82),
                            length: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${menuItems[index].price * (productQuantity != 0 ? productQuantity : 1)} ${String.fromCharCode(0x20B4)}',
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
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: AddOrRemoveFromCart(menuItem: menuItems[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
