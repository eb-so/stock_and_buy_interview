// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_and_buy_interview/problem_solving/bundle_tree.dart';
import 'package:stock_and_buy_interview/problem_solving/models/bundle.dart';

void main() {
  group('BundleTreeTest -', () {
    group('calculateProductionCap -', () {
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
          'When bundle require two part, Should stop at the fewest parts amount',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        bike.add(BundleTree(Component('steering wheel', 10)));
        expect(bike.calculateProductionCap(), 10);
      });
      test('When there three parts, Should stop at the fewest parts amount',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        bike.add(BundleTree(Component('steering wheel', 10)));
        bike.add(BundleTree(Component('seat', 2)));
        expect(bike.calculateProductionCap(), 2);
      });

      test(
          'When you have another bundel inside your bunder, Should calculate the outcome of that bundel',
          () {
        final bike = BundleTree(Bundle('bike'));

        final wheels = bike.add(BundleTree(Bundle('Wheels'), multiplier: 2));
        wheels.add(BundleTree(Component('tube', 10)));
        wheels.add(BundleTree(Component('frame', 20)));

        expect(bike.calculateProductionCap(), 5);
      });
    });
  });
}
