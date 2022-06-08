import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:prestpuesta/helpers/index.dart';
part 'materiales_event.dart';
part 'materiales_state.dart';

class MaterialesBloc extends Bloc<MaterialesEvent, MaterialesState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Map<String, String>> textFieldsValue = [];
  Map<String, String> valores = {
    "nombre": "nombres",
    "precio": "precios",
    "Ancho": "ancho",
    "Altura": "altura",
    "Largo": "largo",
    "unidad": "",
  };
  final Materiales materiales = Materiales();
  MaterialesBloc()
      : super(MaterialesState(
          i: 0,
        )) {
    on<MaterialesEvent>((event, emit) {
      if (event is onSeleccionIndx) {
        emit(state.copyWith(
            i: event.i, materiales: materiales.getMateriales(event.i)));
      } else if (event is OnAddMaterila) {
        emit(state.copyWith(materiales: event.materiales));
      }
    });
  }

  setValores() {
    final material = selectMaterial(state.i!, valores);
    materiales.setMateriales(state.i!, [material]);
    add(OnAddMaterila(materiales.getMateriales(state.i!)));
    resetValor();
  }

  bool isValidForm() {
    if (valores["unidad"] == "") {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  setValor(String nom, String value) {
    valores[nom] = value;
  }

  resetValor() {
    formKey.currentState?.reset();
    valores = {
      "nombre": "",
      "precio": "",
      "Ancho": "",
      "Altura": "",
      "Largo": "",
      "unidad": "",
    };
  }
}
