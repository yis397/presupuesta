import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:prestpuesta/class/valoresCalculo.dart';
import 'package:prestpuesta/helpers/calcMuro.dart';
import 'package:prestpuesta/helpers/calculoPiso.dart';
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
      default:
    }
  }

  calular() {
    switch (state.i) {
      case 0:
        if (isValidForm() && valores.muroValid()) {
          add(OnCalculoMuro(
              alto: valores.valores["Altura"],
              ancho: valores.valores["Ancho"],
              largo: valores.valores["Largo"],
              ly: valores.valores["ly"],
              bloque: valores.valores["bloque"],
              arena: valores.valores["arena"],
              cemento: valores.valores["cemento"]));
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
        add(OnCalculoPiso(
            largo: valores.valores["Largo"],
            ancho: valores.valores["Ancho"],
            alto: valores.valores["Alto"],
            cemento: valores.valores["cemento"],
            arena: valores.valores["arena"],
            grava: valores.valores["grava"],
            resistencia: valores.valores["Resistencia"]));
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
