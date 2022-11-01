import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String email;
  const CustomerCard({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Expanded(
          child: Text(
            'Customer',
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              email,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        )
      ]),
    );
  }
}
