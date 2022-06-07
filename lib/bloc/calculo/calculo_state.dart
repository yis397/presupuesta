part of 'calculo_bloc.dart';

class CalculoState {
  final int? i;
  CalculoState({this.i});

  CalculoState copyWith({int? i}) => CalculoState(i: i ?? this.i);
}
