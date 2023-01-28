import 'package:flutter/material.dart';

class AddOrRemoveFromCart extends StatelessWidget {
  const AddOrRemoveFromCart({
    super.key,
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
              onTap: () {},
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
          ),
          const Text(
            '0',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
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
