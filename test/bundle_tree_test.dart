// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_and_buy_interview/problem_solving/bundle_tree.dart';
import 'package:stock_and_buy_interview/problem_solving/models/bundle.dart';

void main() {
  group('BundleTreeTest -', () {
    group('calculateProductionCap -', () {
      test(
          'When bike requires one compnent, Bike production cap should be the compnent production cap',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        expect(bike.calculateProductionCap(), 20);
      });
      test(
          'When bundle require two parts, Should stop at the fewest parts amount',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        bike.add(BundleTree(Component('steering wheel', 10)));
        expect(bike.calculateProductionCap(), 10);
      });
      test(
          'When there a component that has a multiplier, Should devide the number of components on the multiplier',
          () {
        final bike = BundleTree(Bundle(
          'bike',
        ));

        bike.add(BundleTree(Component('body', 20)));
        bike.add(BundleTree(Component('steering wheel', 10), multiplier: 2));
        bike.add(BundleTree(Component('seat', 6)));

        expect(bike.calculateProductionCap(), 5);
      });

      test(
          'When you have another bundel inside your bundle, Should apply the multiplier to the children components',
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
