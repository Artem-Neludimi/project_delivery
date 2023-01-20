import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_bloc.dart';
import '../cart_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('qq'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      Positioned(
                          child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          Positioned(
                              top: 3.0,
                              right: 7,
                              child: Center(
                                child: Text(
                                  '$totalCount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GestureDetector(
              onTap: () {
                bloc.addToCart(index);
              },
              child: FlutterLogo());
        }),
      ),
    );
  }
}
