import 'package:flutter/material.dart';

import '../utils/ui_helpers.dart';
import 'cards/product_card.dart';

class CollectionsBody extends StatelessWidget {
  const CollectionsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        shadowColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('All collections'),
            Icon(
              Icons.arrow_drop_down,
              size: 24,
              color: Colors.black,
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            UiHelpers.smallSpace,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Quick sale',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            UiHelpers.smallSpace,
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 4),
              itemBuilder: (context, index) => ProductCard(
                  name: 'lorem $index',
                  remaingInStock: index,
                  imgUrl: 'https://picsum.photos/300/$index/'),
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Page 1 of 3',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
