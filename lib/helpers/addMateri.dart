Map<String, dynamic> selectMaterial(int i, Map valor) {
  Map<String, dynamic> material = {};
  DateTime date = DateTime.now();
  switch (i) {
    //bolques
    case 0:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "Ancho": valor["Ancho"],
        "Altura": valor["Altura"],
        "Largo": valor["Largo"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"]
      };

      break;
    case 1:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"]
      };
      break;
    case 2:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"]
      };
      break;
    case 3:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"]
      };
      break;
    case 4:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"],
        "pulgada": valor["pulgada"],
      };
      break;
    case 5:
      material = {
        "nombre": valor["nombre"],
        "precio": valor["precio"],
        "id": date.microsecondsSinceEpoch,
        "unidad": valor["unidad"]
      };
      break;
    default:
  }
  return material;
}
