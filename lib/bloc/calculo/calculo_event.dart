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
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];
  OnCalculoMuro({required this.datos});
  calculo() {
    respuesta = calculoMuro(
        datos['largo'],
        datos['alto'],
        datos['ly'],
        datos['ancho'],
        datos['area'],
        datos['bloque']['unidad'],
        datos['bloque']['precio'],
        datos['cemento']['unidad'],
        datos['cemento']['precio'],
        datos['arena']['unidad'],
        datos['arena']['precio']);
  }
}

class OnCalculoPiso extends CalculoEvent {
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];

  OnCalculoPiso({required this.datos});

  calculo() {
    respuesta = calculoPiso(datos['area'], datos['alto'], datos['resistencia'],
        datos['cemento'], datos['arena'], datos['grava']);
  }
}

class OnCalculoZapata extends CalculoEvent {
  final Map datos;
  List<Map<String, dynamic>> respuesta = [];
  OnCalculoZapata(this.datos);

  calculo() {
    respuesta = calculoZapataI(
        datos['ancho'],
        datos['largo'],
        datos['alto'],
        datos['gancho'],
        datos['rec'],
        datos['separacion'],
        double.parse(datos['aceroAnch']['peso']),
        double.parse(datos['aceroLong']['peso']),
        double.parse(datos['aceroAnch']['precio']),
        double.parse(datos['aceroLong']['precio']),
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

  OnCalculoTrabe(this.datos);

  calculo() {
    respuesta = calculoTrabe(
        datos['aceroLong'],
        datos['estribo'],
        double.parse(datos['aceroLong']['peso']),
        double.parse(datos['estribo']['peso']),
        datos['rec'],
        datos['ancho'],
        datos['altura'],
        datos['largo'],
        datos['separacion'],
        datos['ganchoEst'],
        datos['ganchoLng'],
        double.parse(datos['estribo']['precio']),
        double.parse(datos['aceroLong']['precio']),
        datos['numVar'],
        datos['cemento'],
        datos['arena'],
        datos['grava'],
        datos['resistencia']);
  }
}
