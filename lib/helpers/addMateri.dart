// ignore_for_file: file_names

part of './helpers.dart';

Map<String, dynamic> selectMaterial(int i, Map valor) {
  Map<String, dynamic> material = {};
  DateTime date = DateTime.now();
  switch (i) {
    //bolques
    case 0:
      material = {
        'nombre': '${valor['nombre']}/${valor['unidad']}',
        'precio': double.parse(valor['precio']),
        'Ancho': double.parse(valor['Ancho']),
        'Altura': double.parse(valor['Altura']),
        'Largo': double.parse(valor['Largo']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad']
      };

      break;
    case 1:
      material = {
        'nombre': '${valor['nombre']}/${valor['unidad']}',
        'precio': double.parse(valor['precio']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad']
      };
      break;
    case 2:
      material = {
        'nombre': '${valor['nombre']}/${valor['unidad']}',
        'precio': double.parse(valor['precio']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad']
      };
      break;
    case 3:
      material = {
        'nombre': '${valor['nombre']}/${valor['unidad']}',
        'precio': double.parse(valor['precio']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad']
      };
      break;
    case 4:
      material = {
        'nombre': '${valor['nombre']}/${valor['pulgada']}',
        'precio': double.parse(valor['precio']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad'],
        'pulgada': valor['pulgada'],
        'peso': double.parse(valor['peso']),
      };
      break;
    case 5:
      material = {
        'nombre': '${valor['nombre']}/${valor['unidad']}',
        'precio': double.parse(valor['precio']),
        'id': date.microsecondsSinceEpoch,
        'unidad': valor['unidad']
      };
      break;
    default:
  }
  return material;
}
