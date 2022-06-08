part of 'calculo_bloc.dart';

@immutable
abstract class CalculoEvent {}

class OnCambio extends CalculoEvent {
  final int i;
  final Widget materilaes;
  OnCambio({required this.i, required this.materilaes});
}

class OnMensaje extends CalculoEvent {
  final String msg;
  OnMensaje(this.msg);
}

class OnCalculoMuro extends CalculoEvent {
  final String ly;
  final String ancho;
  final String alto;
  final String largo;
  final Map<String, dynamic> bloque;
  final Map<String, dynamic> cemento;
  final Map<String, dynamic> arena;
  List<Map<String, dynamic>> respuesta = [];
  OnCalculoMuro({
    required this.alto,
    required this.ancho,
    required this.largo,
    required this.ly,
    required this.bloque,
    required this.arena,
    required this.cemento,
  });
  calculo() {
    respuesta = calculoMuro(
        double.parse(largo),
        double.parse(alto),
        double.parse(ly),
        double.parse(ancho),
        (double.parse(largo) * double.parse(alto)),
        bloque["unidad"],
        bloque["precio"],
        cemento["unidad"],
        cemento["precio"],
        arena["unidad"],
        arena["precio"]);
  }
}

class OnCalculoPiso extends CalculoEvent {
  final String largo;
  final String ancho;
  final String alto;
  final String resistencia;
  final Map<String, dynamic> cemento;
  final Map<String, dynamic> arena;
  final Map<String, dynamic> grava;
  List<Map<String, dynamic>> respuesta = [];

  OnCalculoPiso(
      {required this.largo,
      required this.ancho,
      required this.alto,
      required this.cemento,
      required this.arena,
      required this.grava,
      required this.resistencia});

  calculo() {
    respuesta = calculoPiso((double.parse(largo) * double.parse(ancho)),
        double.parse(alto), resistencia, cemento, arena, grava);
  }
}
