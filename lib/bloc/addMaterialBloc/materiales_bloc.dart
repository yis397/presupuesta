import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:prestpuesta/helpers/helpers.dart';
part 'materiales_event.dart';
part 'materiales_state.dart';

class MaterialesBloc extends Bloc<MaterialesEvent, MaterialesState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Map<String, String>> textFieldsValue = [];
  Map<String, String> valores = {
    'nombre': '',
    'precio': '',
    'Ancho': '',
    'Altura': '',
    'Largo': '',
    'unidad': '',
    'peso': '',
    'pulgada': ''
  };
  final Materiales materiales = Materiales();
  MaterialesBloc()
      : super(MaterialesState(
          i: 0,
        )) {
    on<MaterialesEvent>((event, emit) {
      if (event is OnSeleccionIndx) {
        emit(state.copyWith(
            i: event.i, materiales: materiales.getMateriales(event.i)));
      } else if (event is OnAddMaterila) {
        emit(state.copyWith(materiales: event.materiales));
      } else if (event is OnDeletMaterial) {
        emit(state.copyWith(materiales: event.materiales));
      }
    });
  }

  setValores() {
    if (state.materiales!.length == 5) {
      resetValor();
      formKey.currentState?.reset();
      return;
    }
    final material = selectMaterial(state.i!, valores);
    materiales.setMateriales(state.i!, [material]);
    add(OnAddMaterila(materiales.getMateriales(state.i!)));
    resetValor();
    formKey.currentState?.reset();
  }

  bool isValidForm() {
    if (state.i == 4) {
      if (valores['unidad'] == '' && valores['pulgada'] == '') {
        return false;
      }
    }
    if (valores['unidad'] == '') {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  setValor(String nom, String value) {
    if (nom == "pulgada") {
      switch (value) {
        case '1/4':
          valores['peso'] = '0.250';
          break;
        case '3/8':
          valores['peso'] = '0.557';
          break;
        case '1/2':
          valores['peso'] = '0.996';
          break;
        case '5/8':
          valores['peso'] = '1.560';
          break;
        case '3/4':
          valores['peso'] = '2.250';
          break;
        default:
      }
    }
    valores[nom] = value;
  }

  resetValor() {
    formKey.currentState?.reset();
    valores = {
      'nombre': '',
      'precio': '',
      'Ancho': '',
      'Altura': '',
      'Largo': '',
      'unidad': '',
      'peso': '',
      'pulgada': ''
    };
  }

  void deletMaterial(int id) {
    materiales.deletMaterial(state.i!, id);
    add(OnDeletMaterial(materiales.getMateriales(state.i!)));
  }

  delet() {
    materiales.db.delet();
  }
}
