import 'package:flutter/material.dart';
import 'package:project_delivery/providers/cart/cart.dart';
import 'package:provider/provider.dart';

import '../providers/menu/menu.dart';

class AddOrRemoveFromCart extends StatelessWidget {
  final MenuItem menuItem;

  const AddOrRemoveFromCart({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                Provider.of<Cart>(context, listen: false)
                    .deleteFromCart(menuItem);
              },
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
          ),
          Text(
            Provider.of<Cart>(context).theSameProductQuantity(menuItem),
            style: const TextStyle(color: Colors.orange, fontSize: 20),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                Provider.of<Cart>(context, listen: false).addToCart(menuItem);
              },
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
