import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  final String title;
  final String price;
  final String imgUrl;
  const CheckoutCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 42, right: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
            width: 30,
            height: 50,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Text(
          '\$$price',
          style: TextStyle(fontSize: 16),
        )
      ]),
    );
  }
}
