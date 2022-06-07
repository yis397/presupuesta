import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:prestpuesta/db/DbHive.dart';
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

  late DbHive db;
  late Materiales materiales;
  MaterialesBloc()
      : super(MaterialesState(
          i: 0,
        )) {
    initDb();
    on<MaterialesEvent>((event, emit) {
      if (event is onSeleccionIndx) {
        emit(state.copyWith(
          i: event.i,
        ));
      } else if (event is OnAddMaterila) {
        emit(state.copyWith(materiales: event.materiales));
      }
    });
  }

  setValores() {
    String nom = "";
    final material = selectMaterial(state.i!, valores);
    final List<dynamic> materiales = state.materiales ?? [];
    materiales.add(material);
    switch (state.i) {
      //bolques
      case 0:
        nom = "bloques";
        break;
      case 1:
        nom = "cementos";
        break;
      case 2:
        nom = "arenas";
        break;
      case 3:
        nom = "gravas";
        break;
      case 4:
        nom = "varillas";
        break;
      case 5:
        nom = "piedras";
        break;
      default:
    }
    add(OnAddMaterila(materiales));
    db.setBloques(materiales, nom);
    resetValor();
  }

  bool isValidForm() {
    if (valores["unidad"] == "") {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  initDb() {
    materiales = Materiales();
    db = DbHive();
    Timer(
        Duration(seconds: 4),
        () => {
              for (var i = 0; i < 6; i++)
                {
                  db
                      .getMateriales(i)
                      .then((value) => materiales.setMateriales(i, value))
                }
            });
  }

  get() {
    db.getBloques();
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
