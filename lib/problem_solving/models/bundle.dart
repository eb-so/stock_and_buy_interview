import 'package:equatable/equatable.dart';

class Bundle extends Equatable {
  final String name;

  const Bundle(this.name);

  @override
  List<Object?> get props => [
        name,
      ];
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
