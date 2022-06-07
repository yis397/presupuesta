import 'dart:async';

import '../db/DbHive.dart';

class Materiales {
  List<dynamic> _cementos = [];
  List<dynamic> _arenas = [];
  List<dynamic> _gravas = [];
  List<dynamic> _varillas = [];
  List<dynamic> _bloques = [];
  List<dynamic> _piedras = [];
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
        Duration(seconds: 4),
        () => {
              for (var i = 0; i < 6; i++)
                {db.getMateriales(i).then((value) => setMateriales(i, value))}
            });
  }

  setMateriales(int i, List<dynamic> datos) {
    switch (i) {
      case 0:
        _bloques = [..._bloques, ...datos];
        break;
      case 1:
        _cementos = [..._cementos, ...datos];

        break;
      case 2:
        _arenas = [..._arenas, ...datos];
        break;
      case 3:
        _gravas = [..._gravas, ...datos];
        break;
      case 4:
        _varillas = [..._varillas, ...datos];
        break;
      case 5:
        _piedras = [..._piedras, ...datos];
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
