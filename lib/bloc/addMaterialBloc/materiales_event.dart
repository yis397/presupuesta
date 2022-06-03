part of 'materiales_bloc.dart';

@immutable
abstract class MaterialesEvent {}

class onSeleccionIndx extends MaterialesEvent {
  final int i;

  onSeleccionIndx(this.i);
}

class OnAddMaterila extends MaterialesEvent {
  final List<dynamic> materiales;

  OnAddMaterila(this.materiales) {}
}
