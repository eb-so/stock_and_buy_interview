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
    void Function(BundleTree node) performAction,
  ) {
    performAction(this);

    for (var child in children) {
      child.forEachDepthFirst(
        performAction,
      );
    }
  }

  int calculateProductionCap() {
    return _calculateProductionCapForBundle(this);
  }

  int _calculateProductionCapForBundle(BundleTree bundletree) {
    int? productionCap;
    int skippingCount = 0;

    bundletree.forEachDepthFirst((currentBundle) {
      if (currentBundle == bundletree || skippingCount > 0) {
        skippingCount--;
        return;
      }

      if (currentBundle.value is! Component) {
        skippingCount = currentBundle.children.length;
        final nestedBundleCap = _calculateProductionCapForBundle(currentBundle);

        productionCap = replaceProductionCap(productionCap, nestedBundleCap);

        return;
      }

      final bundleMultiplier = currentBundle.multiplier;
      final component = currentBundle.value as Component;
      final partsWithMultiplier =
          (component.remainingParts / bundleMultiplier).round();

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
