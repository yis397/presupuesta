part of 'materiales_bloc.dart';

class MaterialesState {
  final int? i;
  final List<dynamic>? materiales;
  MaterialesState({this.i, this.materiales});

  MaterialesState copyWith({int? i, List<dynamic>? materiales}) =>
      MaterialesState(
          i: i ?? this.i, materiales: materiales ?? this.materiales);
}
