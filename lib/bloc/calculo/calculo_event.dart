// ignore_for_file: must_be_immutable

part of 'calculo_bloc.dart';

@immutable
abstract class CalculoEvent {}

class OnCambio extends CalculoEvent {
  final int i;
  final Map nombre;
  final Widget materilaes;
  OnCambio({required this.i, required this.materilaes, required this.nombre});
}

class OnMensaje extends CalculoEvent {
  final String msg;
  OnMensaje(this.msg);
}

class OnReset extends CalculoEvent {
  OnReset();
}

class OnCalculoMuro extends CalculoEvent {
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];
  OnCalculoMuro({required this.datos}) {
    calculo();
  }
  calculo() {
    try {
      respuesta = calculoMuro(
          datos['bloque']['Largo'],
          datos['bloque']['Altura'],
          datos['ly'],
          datos['bloque']['Ancho'],
          datos['area'],
          datos['bloque']['unidad'],
          datos['bloque']['precio'],
          datos['cemento']['unidad'],
          datos['cemento']['precio'],
          datos['arena']['unidad'],
          datos['arena']['precio']);
    } catch (e) {
      respuesta = calculoMuro(
          double.parse(datos['bloque']['Largo']),
          double.parse(datos['bloque']['Altura']),
          datos['ly'],
          double.parse(datos['bloque']['Ancho']),
          datos['area'],
          datos['bloque']['unidad'],
          datos['bloque']['precio'],
          datos['cemento']['unidad'],
          datos['cemento']['precio'],
          datos['arena']['unidad'],
          datos['arena']['precio']);
    }
  }
}

class OnCalculoPiso extends CalculoEvent {
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];

  OnCalculoPiso({required this.datos}) {
    calculo();
  }

  calculo() {
    respuesta = calculoPiso(datos['area'], datos['alto'], datos['resistencia'],
        datos['cemento'], datos['arena'], datos['grava']);
  }
}

class OnCalculoZapata extends CalculoEvent {
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];
  OnCalculoZapata(this.datos) {
    calculo();
  }

  calculo() {
    respuesta = calculoZapataI(
        datos['ancho'],
        datos['largo'],
        datos['alto'],
        datos['gancho'],
        datos['rec'],
        datos['separacion'],
        datos['aceroAnch']['peso'],
        datos['aceroLong']['peso'],
        datos['aceroAnch']['precio'],
        datos['aceroLong']['precio'],
        datos['cemento'],
        datos['arena'],
        datos['grava'],
        datos['resistencia'],
        datos['tipo'],
        datos['h2'],
        datos['h3'],
        datos['a1'],
        datos['b1']);
  }
}

class OnCalculoTrabe extends CalculoEvent {
  List<Map<String, dynamic>> respuesta = [];
  final Map datos;

  OnCalculoTrabe(this.datos) {
    calculo();
  }

  calculo() {
    respuesta = calculoTrabe(
        datos['aceroLong']['nombre'],
        datos['estribo']['nombre'],
        datos['aceroLong']['peso'],
        datos['estribo']['peso'],
        datos['rec'],
        datos['ancho'],
        datos['altura'],
        datos['largo'],
        datos['separacion'],
        datos['ganchoEst'],
        datos['ganchoLng'],
        datos['estribo']['precio'],
        datos['aceroLong']['precio'],
        datos['numVar'],
        datos['cemento'],
        datos['arena'],
        datos['grava'],
        datos['resistencia']);
  }
}
