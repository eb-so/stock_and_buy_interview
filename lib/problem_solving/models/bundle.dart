class Bundle {
  final String name;

  const Bundle(this.name);
}

class Component extends Bundle {
  final int remainingParts;
  const Component(
    super.name,
    this.remainingParts,
  );
}
