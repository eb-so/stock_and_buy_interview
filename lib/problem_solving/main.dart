// ignore_for_file: prefer_const_constructors

import 'package:stock_and_buy_interview/problem_solving/bundle_tree.dart';

import 'models/bundle.dart';

void main(List<String> args) {
  BundleTree bundleTree = BundleTree(const Bundle('Bike'));
  bundleTree.add(BundleTree(Component('seat', 50)));
  bundleTree.add(BundleTree(Component('pedals', 60), multiplier: 2));

  final wheel = bundleTree.add(BundleTree(Bundle('wheel'), multiplier: 2));
  wheel.add(BundleTree(Component('frame', 60)));
  wheel.add(BundleTree(Component('tube', 35)));

  bundleTree.forEachDepthFirst((node) {
    print(node.value);
  });
}
