class Bundle {
  final String name;

  const Bundle(this.name);
}

class Component extends Bundle {
  int remainingParts;
  Component(
    super.name,
    this.remainingParts,
  );

  Component copyWith({String? name, int? remainingParts}) {
    return Component(name ?? this.name, remainingParts ?? this.remainingParts);
  }
}
