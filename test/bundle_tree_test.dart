// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_and_buy_interview/problem_solving/bundle_tree.dart';
import 'package:stock_and_buy_interview/problem_solving/models/bundle.dart';

void main() {
  group('BundleTreeTest -', () {
    group('Bundle with one part -', () {
      test(
          'When bundle require one part, Bundle avaliableParts Should be equal to the part avaliableParts',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        expect(bike.calculateProductionCap(), 20);
      });
      test(
          'When you preduce a bike, Should remove the used parts from the inventory',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        bike.calculateProductionCap();

        final component = bike.children
            .firstWhere((element) => element.value is Component)
            .value as Component;

        expect(component.remainingParts, 19);
      });
    });
  });
}
