// ignore_for_file: prefer_is_empty, non_constant_identifier_names

import 'dart:async';

import '../db/DbHive.dart';

class Materiales {
  List<dynamic> _cementos = [cemento];
  List<dynamic> _arenas = [arena];
  List<dynamic> _gravas = [grava];
  List<dynamic> _varillas = [acero];
  List<dynamic> _bloques = [bloque];
  List<dynamic> _piedras = [piedra];
  late DbHive db;
  static final Materiales _Materiales = Materiales._internal();

  factory Materiales() {
    return _Materiales;
  }

  Materiales._internal();

  List<dynamic> getBloques() => _bloques;
  List<dynamic> getArenas() => _arenas;
  List<dynamic> getGravas() => _gravas;
  List<dynamic> getVarillas() => _varillas;
  List<dynamic> getCemento() => _cementos;
  List<dynamic> getPiedras() => _piedras;

  deletMaterial(int i, int id) {
    switch (i) {
      case 0:
        _bloques.removeWhere((e) => e["id"] == id);
        db.setMaterial(_bloques, "bloques");
        break;
      case 1:
        _cementos.removeWhere((e) => e["id"] == id);
        db.setMaterial(_cementos, "cementos");
        break;
      case 2:
        _arenas.removeWhere((e) => e["id"] == id);
        db.setMaterial(_arenas, "arenas");
        break;
      case 3:
        _gravas.removeWhere((e) => e["id"] == id);
        db.setMaterial(_gravas, "gravas");
        break;
      case 4:
        _varillas.removeWhere((e) => e["id"] == id);
        db.setMaterial(_varillas, "varillas");
        break;
      case 5:
        _piedras.removeWhere((e) => e["id"] == id);
        db.setMaterial(_piedras, "piedras");
        break;
      default:
    }
  }

  initDb() {
    db = DbHive();
    Timer(
        const Duration(seconds: 4),
        () => {
              for (var i = 0; i < 6; i++)
                {db.getMateriales(i).then((value) => setMateriales2(i, value))}
            });
  }

  setMateriales(int i, List<dynamic> datos) {
    switch (i) {
      case 0:
        _bloques = [..._bloques, ...datos];
        db.setMaterial(_bloques, "bloques");
        break;
      case 1:
        _cementos = [..._cementos, ...datos];
        db.setMaterial(_cementos, "cementos");
        break;
      case 2:
        _arenas = [..._arenas, ...datos];
        db.setMaterial(_arenas, "arenas");
        break;
      case 3:
        _gravas = [..._gravas, ...datos];
        db.setMaterial(_gravas, "gravas");
        break;
      case 4:
        _varillas = [..._varillas, ...datos];
        db.setMaterial(_varillas, "varillas");
        break;
      case 5:
        _piedras = [..._piedras, ...datos];
        db.setMaterial(_piedras, "piedras");
        break;
      default:
    }
  }

  setMateriales2(int i, List<dynamic> datos) {
    switch (i) {
      case 0:
        if (datos.length >= 1) {
          _bloques = [...datos];
        } else {
          _bloques = [bloque, ...datos];
        }

        break;
      case 1:
        if (datos.length >= 1) {
          _cementos = [...datos];
        } else {
          _cementos = [cemento, ...datos];
        }

        break;
      case 2:
        if (datos.length >= 1) {
          _arenas = [...datos];
        } else {
          _arenas = [arena, ...datos];
        }

        break;
      case 3:
        if (datos.length >= 1) {
          _gravas = [...datos];
        } else {
          _gravas = [grava, ...datos];
        }

        break;
      case 4:
        if (datos.length >= 1) {
        } else {
          _varillas = [acero, ...datos];
        }

        break;
      case 5:
        if (datos.length >= 1) {
          _piedras = [...datos];
        } else {
          _piedras = [piedra, ...datos];
        }

        break;
      default:
    }
  }

  List<dynamic> getMateriales(int i) {
    switch (i) {
      case 0:
        return getBloques();

      case 1:
        return getCemento();
      case 2:
        return getArenas();
      case 3:
        return getGravas();
      case 4:
        return getVarillas();
      case 5:
        return getPiedras();
      default:
        return [];
    }
  }
}

Map<String, dynamic> cemento = {
  'nombre': "cemento/ton",
  'precio': 3975.0,
  'unidad': "ton",
  'id': 1234,
};

Map<String, dynamic> bloque = {
  'nombre': "ladrillo/un",
  'precio': 7.0,
  'Ancho': "14",
  'Altura': "8",
  'Largo': "23",
  'id': 123,
  'unidad': "un"
};
Map<String, dynamic> arena = {
  'nombre': "arena/ton",
  'precio': 1200.0,
  'unidad': "ton",
  'id': 12345,
};
Map<String, dynamic> grava = {
  'nombre': "grava/ton",
  'precio': 1200.0,
  'unidad': "ton",
  'id': 123451,
};
Map<String, dynamic> piedra = {
  'nombre': "caliza/ton",
  'precio': 1200.0,
  'unidad': "ton",
  'id': 123456,
};
Map<String, dynamic> acero = {
  'nombre': "acero/3/8",
  'precio': 18500.0,
  'unidad': "ton",
  'id': 123456,
  'pulgada': "3/8",
  'peso': 0.991,
};
