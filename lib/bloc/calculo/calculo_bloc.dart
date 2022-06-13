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
  CalculoBloc() : super(CalculoState(i: 0)) {
    materiales.initDb();
    on<CalculoEvent>((event, emit) {
      if (event is OnCambio) {
        emit(state.copyWith(i: event.i, materiales: event.materilaes));
      } else if (event is OnMensaje) {
        emit(state.copyWith(msg: event.msg));
      } else if (event is OnCalculoMuro) {
        emit(state.copyWith(respuesta: event.respuesta));
      } else if (event is OnCalculoZapata) {
        emit(state.copyWith(respuesta: event.respuesta));
      }
      // TODO: implement event handler
    });
  }
  selectCalculo(int i) {
    switch (i) {
      case 0:
        add(OnCambio(
            i: i,
            materilaes: Row(
              children: [
                WlstaDesp(materiales.getBloques(), "bloque", 2),
                WlstaDesp(materiales.getCemento(), "cemento", 2),
                WlstaDesp(materiales.getArenas(), "arena", 2)
              ],
            )));
        break;
      case 1:
        add(OnCambio(
            i: i,
            materilaes: Row(
              children: [
                WlstaDesp(materiales.getBloques(), "grava", 2),
                WlstaDesp(materiales.getCemento(), "cemento", 2),
                WlstaDesp(materiales.getArenas(), "arena", 2)
              ],
            )));
        break;
      case 2:
        add(OnCambio(
            i: i,
            materilaes: Row(
              children: [
                WlstaDesp(materiales.getBloques(), "grava", 2),
                WlstaDesp(materiales.getCemento(), "cemento", 2),
                WlstaDesp(materiales.getArenas(), "arena", 2),
                WlstaDesp(materiales.getVarillas(), "acero-long", 2),
                WlstaDesp(materiales.getVarillas(), "acero-anch", 2),
              ],
            )));
        break;
      default:
    }
  }

  calular() {
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
        if (!isValidForm() && !valores.concretoValid()) {
          add(OnMensaje("Llene todos los campos"));
          return;
        }
        add(OnCalculoPiso(datos: valores.getValor(1)));
        add(OnMensaje(""));
        resetValor();
        break;
      case 2:
        if (!valores.zapataValid()) {
          add(OnMensaje("Llene todos los campos"));
          return;
        }
        add(OnCalculoZapata(valores.getValor(2)));
        add(OnMensaje(""));
        resetValor();
        break;
      case 3:
        if (!valores.zapataValid()) {
          add(OnMensaje("Llene todos los campos"));
          return;
        }
        add(OnCalculoTrabe(valores.getValor(3)));
        add(OnMensaje(""));
        resetValor();
        break;
      default:
    }
  }

  isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  setValor(String nom, String value) {
    valores.setValor(nom, value);
  }

  resetValor() {
    formKey.currentState?.reset();
    valores.resetValor();
  }
}
