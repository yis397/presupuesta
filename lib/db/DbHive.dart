import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class DbHive {
  String path = "";
  final hive = Hive;
  late Box box;
  Db() {
    init();
  }

  DbHive() {
    init();
  }
  init() async {
    await Hive.initFlutter();
    await inicializarBox();
  }

  inicializarBox() async {
    final directori = await getApplicationSupportDirectory();
    hive.init(directori.path);
    box = await hive.openBox('materiales');
    print('${box.isOpen} inicializado');
  }

  setBloques(List<dynamic> materiales, String nom) async {
    await box.put(nom, materiales);
    print("agregado");
  }

  getBloques() async {
    final bloques = await box.get("bloques");
    print(bloques);
  }

  List<dynamic> getMateriales(int i) {
    switch (i) {
      case 0:
        return box.get("bloques") ?? [];
      case 1:
        return box.get("cementos") ?? [];
      case 2:
        return box.get("arenas") ?? [];
      case 3:
        return box.get("gravas") ?? [];
      case 4:
        return box.get("varillas") ?? [];
      case 5:
        return box.get("piedras") ?? [];
      default:
        return [];
    }
  }

  delet() async {
    await box.delete("bloques");
    print("eliminado");
  }
}
