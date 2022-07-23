class Recordatorio {
  String nombre = "";
  int idp = 0;
  int id = 0;
  String recordatorio = "";
  String fecha = "";

  Recordatorio(
      {required this.nombre,
      required this.recordatorio,
      required this.idp,
      required this.id,
      String fech = ""}) {
    fecha = fech;
  }
  Map<String, dynamic> getMap() {
    return {
      'nombre': nombre,
      'idp': idp,
      'id': id,
      'recordatorio': recordatorio,
      'fecha': fecha
    };
  }
}

class ListRecordatorio {
  List<Recordatorio> list = [];
  setList(List<dynamic> data) {
    if (data.isEmpty) return;
    for (var i = 0; i < data.length; i++) {
      list.add(Recordatorio(
        nombre: data[i]['nombre'],
        recordatorio: data[i]['recordatorio'],
        idp: data[i]['idp'],
        id: data[i]['id'],
        fech: data[i]['fecha'],
      ));
    }
  }

  List<Map<String, dynamic>> getMap() {
    List<Map<String, dynamic>> lista = [];
    for (var i = 0; i < list.length; i++) {
      lista.add(list[i].getMap());
    }
    return lista;
  }
}
