// ignore_for_file: file_names

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class DbHive {
  String path = "";
  final hive = Hive;
  late Box box;
  db() {
    init();
  }

  Future<bool> init() async {
    await Hive.initFlutter();
    return await inicializarBox();
  }

  Future<bool> inicializarBox() async {
    final directori = await getApplicationSupportDirectory();
    hive.init(directori.path);
    box = await hive.openBox('materiales');
    if (!box.containsKey(1)) {
      return true;
    } else {
      return false;
    }
  }

  setMaterial(List<dynamic> materiales, String nom) async {
    await box.put(nom, materiales);
  }

  Future<List<dynamic>> getMateriales(int i) async {
    switch (i) {
      case 0:
        return await box.get("bloques") ?? [];
      case 1:
        return await box.get("cementos") ?? [];
      case 2:
        return await box.get("arenas") ?? [];
      case 3:
        return await box.get("gravas") ?? [];
      case 4:
        return await box.get("varillas") ?? [];
      case 5:
        return await box.get("piedras") ?? [];
      default:
        return [];
    }
  }

  delet() async {
    await box.delete("bloques");
    await box.delete("cementos");
    await box.delete("arenas");
    await box.delete("gravas");
    await box.delete("varillas");
    await box.delete("piedras");
  }

  setRecordatorio(List<Map<String, dynamic>> list) async {
    await box.put('recordatorio', list);
  }

  Future<List<dynamic>> getRecordatorio() async {
    return await box.get("recordatorio") ?? [];
  }
}
