import 'package:flutter/material.dart';

import 'widgets/checkout_body.dart';
import 'widgets/collection_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            label: 'Checkout', icon: Icon(Icons.shopping_cart_checkout)),
        BottomNavigationBarItem(
            label: 'Orders', icon: Icon(Icons.inbox_outlined)),
        BottomNavigationBarItem(
            label: 'Store', icon: Icon(Icons.store_outlined))
      ]),
      body: Row(
        children: const [
          Expanded(flex: 7, child: CollectionsBody()),
          Expanded(flex: 4, child: CheckoutBody()),
        ],
      ),
    );
  }
}
