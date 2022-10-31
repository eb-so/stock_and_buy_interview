import 'package:equatable/equatable.dart';

import 'models/bundle.dart';

class BundleTree extends Equatable {
  BundleTree(
    this.value, {
    this.multiplier = 1,
  });

  Bundle value;
  int multiplier;
  List<BundleTree> children = [];

  BundleTree add(BundleTree node) {
    children.add(node);

    return node;
  }

  void forEachDepthFirst(
    void Function(BundleTree node, int? rep) performAction, [
    int? multiplier,
  ]) {
    performAction(this, multiplier);

    for (var child in children) {
      child.forEachDepthFirst(performAction, this.multiplier);
    }
  }

  int calculateProductionCap() {
    return _calculateProductionCapForBundle(this);
  }

  int _calculateProductionCapForBundle(BundleTree bundletree) {
    int? productionCap;

    bundletree.forEachDepthFirst((currentBundle, parentMultiplier) {
      if (currentBundle.value is! Component) {
        return;
      }

      final bundleMultiplier = currentBundle.multiplier;
      final component = currentBundle.value as Component;

      final currentMultiplier = bundleMultiplier * (parentMultiplier ?? 1);

      final partsWithMultiplier =
          (component.remainingParts / currentMultiplier).round();

      productionCap = replaceProductionCap(productionCap, partsWithMultiplier);
    });

    return productionCap ?? 0;
  }

  int? replaceProductionCap(int? firstPartToBeOut, int partsWithMultiplier) {
    if (firstPartToBeOut == null || partsWithMultiplier < firstPartToBeOut) {
      firstPartToBeOut = partsWithMultiplier;
    }
    return firstPartToBeOut;
  }

  @override
  List<Object?> get props => [value, multiplier];
}
