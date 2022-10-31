import 'models/bundle.dart';

class BundleTree {
  BundleTree(
    this.value, {
    this.multiplier = 1,
  });

  final Bundle value;
  final int multiplier;
  final List<BundleTree> children = [];

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
      /// Here I'm passing the parent multiplier to his children
      child.forEachDepthFirst(performAction, this.multiplier);
    }
  }

  int calculateProductionCap() {
    int? productionCap;

    forEachDepthFirst((currentBundle, parentMultiplier) {
      /// When the node is not a component(a bundle) skip this iteration
      if (currentBundle.value is! Component) {
        return;
      }

      final component = currentBundle.value as Component;

      /// Current component multiply by parent component
      final totalMultiplier =
          currentBundle.multiplier * (parentMultiplier ?? 1);

      /// The number of bundles before this component run out
      final compunentCap = (component.remainingParts / totalMultiplier).round();

      productionCap = _replaceProductionCap(productionCap, compunentCap);
    });

    return productionCap ?? 0;
  }

  int? _replaceProductionCap(int? productionCap, int compunentCap) {
    /// if the production cap is null or more than the compunentCap
    /// We should change the productionCap to the new lowest value
    if (productionCap == null || compunentCap < productionCap) {
      productionCap = compunentCap;
    }
    return productionCap;
  }
}
