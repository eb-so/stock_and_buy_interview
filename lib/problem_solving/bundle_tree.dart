import 'models/bundle.dart';

class BundleTree {
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

  void forEachDepthFirst(void Function(BundleTree node) performAction) {
    performAction(this);

    for (var child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  int calculateProductionCap() {
    int? tempAvailablePart;

    forEachDepthFirst((node) {
      if (node.value is! Component) return;
      final component = node.value as Component;

      if (tempAvailablePart == null ||
          component.remainingParts < tempAvailablePart!) {
        tempAvailablePart = component.remainingParts;
        node = _removeUsedParts(node);
      }
    });

    return tempAvailablePart ?? 0;
  }

  // BundleTree _removeUsedParts(BundleTree node) {
  //   final nodeMultiplier = node.multiplier;

  //   return node.copyWith(avaliableParts: node.avaliableParts! - nodeMultiplier);
  // }

  BundleTree copyWith({
    Bundle? value,
    int? multiplier,
    int? avaliableParts,
    List<BundleTree>? children,
  }) {
    return BundleTree(
      value ?? this.value,
      multiplier: multiplier ?? this.multiplier,
    );
  }
}
