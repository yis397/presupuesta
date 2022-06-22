part of 'materiales_bloc.dart';

@immutable
abstract class MaterialesEvent {}

class OnSeleccionIndx extends MaterialesEvent {
  final int i;

  OnSeleccionIndx(this.i);
}

class OnAddMaterila extends MaterialesEvent {
  final List<dynamic> materiales;

  OnAddMaterila(this.materiales);
}

class OnDeletMaterial extends MaterialesEvent {
  final List<dynamic> materiales;

  OnDeletMaterial(
    this.materiales,
  );
}
