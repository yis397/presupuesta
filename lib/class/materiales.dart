import 'package:hive/hive.dart';
part 'materiales.g.dart';

@HiveType(typeId: 1)
class Materiales extends HiveObject {
  @HiveField(0)
  List<Map<String, String>> bloques = [];
  @HiveField(1)
  List<Map<String, String>> cementos = [];
  @HiveField(2)
  List<Map<String, String>> arenas = [];
  @HiveField(3)
  List<Map<String, String>> gravas = [];
  @HiveField(4)
  List<Map<String, String>> varillas = [];
  @HiveField(5)
  List<Map<String, String>> piedras = [];
}
