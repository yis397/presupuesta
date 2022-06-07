part of 'calculo_bloc.dart';

@immutable
abstract class CalculoEvent {}

class OnCambio extends CalculoEvent {
  final int i;
  OnCambio({required this.i});
}
