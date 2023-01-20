import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex]!;
          return ListTile(
            leading: FlutterLogo(),
            title: Text('Item Count: $count'),
            trailing: TextButton(
              child: Text('Clear'),
              onPressed: () {
                bloc.clear(giftIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
