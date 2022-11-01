import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  final int remaingInStock;
  const ProductCard({
    Key? key,
    required this.name,
    required this.remaingInStock,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(name),
              Text(
                '$remaingInStock in stock',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ))
        ],
      ),
    );
  }
}
