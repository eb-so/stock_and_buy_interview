import 'package:flutter/material.dart';
import 'package:stock_and_buy_interview/ui/utils/ui_helpers.dart';
import 'package:stock_and_buy_interview/ui/widgets/cards/checkout_card.dart';
import 'package:stock_and_buy_interview/ui/widgets/cards/customer_card.dart';

import 'cards/charge_card.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Cart'),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.delete_outline,
              size: 26,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.more_horiz_outlined,
              size: 26,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          UiHelpers.smallSpace,
          ListView(
            shrinkWrap: true,
            children: const [
              CheckoutCard(
                  title: 'Whalnut lamp',
                  price: '99.00',
                  imgUrl: 'https://picsum.photos/300/300/'),
              Divider(
                height: 1,
              ),
              CheckoutCard(
                  title: 'Whalnut Plunter short',
                  price: '29.00',
                  imgUrl: 'https://picsum.photos/200/300/'),
              Divider(
                height: 1,
              ),
              CheckoutCard(
                  title: 'Maple Trackpad',
                  price: '55.22',
                  imgUrl: 'https://picsum.photos/100/300/'),
            ],
          ),
          UiHelpers.smallSpace,
          CustomerCard(name: 'Kate beri', email: 'me@gmmail.com'),
          UiHelpers.smallSpace,
          ChargeCard(),
        ],
      ),
    );
  }
}
