import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:prestpuesta/class/valoresCalculo.dart';
import 'package:prestpuesta/helpers/helpers.dart';
import 'package:prestpuesta/widgets/widget.dart';
part 'calculo_event.dart';
part 'calculo_state.dart';

class CalculoBloc extends Bloc<CalculoEvent, CalculoState> {
  final Materiales materiales = Materiales();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValoresCalculo valores = ValoresCalculo();
  CalculoBloc() : super(CalculoState(i: 0, nombre: {})) {
    materiales.initDb();
    on<CalculoEvent>((event, emit) {
      if (event is OnCambio) {
        emit(state.copyWith(
            i: event.i, materiales: event.materilaes, nombre: event.nombre));
      } else if (event is OnMensaje) {
        emit(state.copyWith(msg: event.msg));
      } else if (event is OnCalculoMuro) {
        emit(state.copyWith(respuesta: event.respuesta));
      } else if (event is OnCalculoPiso) {
        emit(state.copyWith(respuesta: event.respuesta));
      } else if (event is OnCalculoZapata) {
        emit(state.copyWith(respuesta: event.respuesta));
      } else if (event is OnCalculoTrabe) {
        emit(state.copyWith(respuesta: event.respuesta));
      } else if (event is OnReset) {
        emit(state.copyWith(respuesta: []));
      }
    });
  }
  selectCalculo(int i) {
    Map datos = obraNegra[i];
    switch (i) {
      case 0:
        add(OnCambio(
            i: i,
            nombre: datos,
            materilaes: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                WlstaDesp(materiales.getBloques(), "bloque"),
                WlstaDesp(materiales.getCemento(), "cemento"),
                WlstaDesp(materiales.getArenas(), "arena")
              ],
            )));
        break;
      case 1:
        add(OnCambio(
            i: i,
            nombre: datos,
            materilaes: Row(
              children: [
                WlstaDesp(materiales.getGravas(), "grava"),
                WlstaDesp(materiales.getCemento(), "cemento"),
                WlstaDesp(materiales.getArenas(), "arena")
              ],
            )));
        break;
      case 2:
      case 3:
      case 4:
        add(OnCambio(
            i: i,
            nombre: datos,
            materilaes: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    WlstaDesp(materiales.getGravas(), "grava"),
                    WlstaDesp(materiales.getCemento(), "cemento"),
                    WlstaDesp(materiales.getArenas(), "arena"),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    WlstaDesp(materiales.getVarillas(), "aceroLong"),
                    i == 4
                        ? WlstaDesp(materiales.getVarillas(), "estribo")
                        : WlstaDesp(materiales.getVarillas(), "acero-anch"),
                  ],
                ),
              ],
            )));
        break;
      default:
    }
  }

  calcular() {
    switch (state.i) {
      case 0:
        if (isValidForm() && valores.muroValid()) {
          add(OnCalculoMuro(datos: valores.getValor(0)));
          add(OnMensaje(""));
          resetValor();
          return;
        }
        add(OnMensaje("Llene todos los campos"));

        break;
      case 1:
        if (!valores.concretoValid()) {
          add(OnMensaje("Llene todos los campos"));
          break;
        }
        add(OnCalculoPiso(datos: valores.getValor(1)));
        add(OnMensaje(""));
        resetValor();
        break;
      case 2:
      case 3:
        if (!valores.zapataValid()) {
          add(OnMensaje("Llene todos los campos"));

          break;
        }
        state.i == 2
            ? add(OnCalculoZapata(valores.getValor(2)))
            : add(OnCalculoZapata(valores.getValor(3)));
        add(OnMensaje(""));
        resetValor();
        break;
      case 4:
        if (!valores.trabeValid()) {
          add(OnMensaje("Llene todos los campos"));
          break;
        }
        add(OnCalculoTrabe(valores.getValor(4)));

        add(OnMensaje(""));
        valores.resetValor();
        resetValor();
        break;
      default:
    }
  }

  isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  setValor(String nom, dynamic value) {
    valores.setValor(nom, value);
  }

  resetValor() {
    formKey.currentState?.reset();
    valores.resetValor();
  }
}
