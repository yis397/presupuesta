part of 'calculo_bloc.dart';

class CalculoState {
  final int? i;
  final Widget? materiales;
  final String? msg;
  final List<Map<String, dynamic>>? respuesta;

  CalculoState({this.i, this.materiales, this.msg, this.respuesta});

  CalculoState copyWith(
          {int? i,
          Widget? materiales,
          String? msg,
          List<Map<String, dynamic>>? respuesta}) =>
      CalculoState(
          i: i ?? this.i,
          materiales: materiales ?? this.materiales,
          respuesta: respuesta ?? this.respuesta,
          msg: msg ?? this.msg);
}
