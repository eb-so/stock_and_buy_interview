import 'package:flutter/material.dart';
import 'package:stock_and_buy_interview/ui/utils/ui_helpers.dart';

class ChargeCard extends StatelessWidget {
  const ChargeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(children: [
        UiHelpers.smallSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add discount',
              style: TextStyle(color: Colors.deepPurple),
            ),
            const Icon(Icons.add_circle_outline_outlined)
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            height: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal',
            ),
            const Text('\$345.00')
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            height: 1,
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add shipping',
                style: TextStyle(color: Colors.deepPurple),
              ),
              const Icon(Icons.add_circle_outline_outlined)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                  child: const Text(
                    '5',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                  child: const Text(
                    'Charge \$389.22',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
