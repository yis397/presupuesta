// ignore_for_file: file_names
part of "helpers.dart";

List<Map<String, dynamic>> calculoZapataI(
    double ancho,
    double largo,
    double alto,
    double gancho,
    double ly,
    double separacion,
    double pesoAncho,
    double pesoLargo,
    double precioAncho,
    double precioLargo,
    Map cemento,
    Map arena,
    Map grava,
    String resistencia,
    String tipo,
    double h2,
    double h3,
    double a1,
    double b1) {
  double mqBase;
  Concreto concreto;
  List<Map<String, dynamic>> data = [];

  AceroZapa zapata = AceroZapa(
      ganchoLong: gancho,
      largo: largo,
      ancho: ancho,
      rec: ly,
      separacion: separacion,
      pesoAncho: pesoAncho,
      pesoLargo: pesoLargo,
      precioAncho: precioAncho,
      precioLargo: precioLargo);
  if (tipo == "1") {
    mqBase = alto * ancho * largo;
  } else {
    mqBase = (alto * ancho * largo +
        (h2 / 3) *
            (a1 * b1 * ancho * largo + pow((a1 * b1 * ancho * largo), .5)) +
        a1 * b1 * h3);
  }

  concreto = concreto = Concreto(
      mqConcreto: mqBase,
      cemUnidad: cemento["unidad"],
      precioCemen: cemento["precio"],
      arenaUnidad: arena["unidad"],
      precioArena: arena["precio"],
      gravaUnidad: grava["unidad"],
      precioGrava: grava["precio"],
      resistencia: resistencia);
  data = [
    {
      "titulo": "Total Cemento:",
      "data": concreto.textCemento(),
      "color": 0xfffffc089
    },
    {
      "titulo": "Total Arena:",
      "data": concreto.textArena(),
      "color": 0xffe98668
    },
    {
      "titulo": "Total Grava:",
      "data": concreto.textGrava(),
      "color": 0xffa95b4f
    },
    {"titulo": "Total Agua:", "data": concreto.textAgua(), "color": 0xffa95b4f},
    {
      "titulo": "Precio Concreto:",
      "data": concreto.textTotal(),
      "color": 0xffa95b4f
    },
    {"titulo": "Acero", "data": "", "color": 0xfffffc089},
    {
      "titulo": "Acero 1:",
      "data": zapata.getPesoAceroLong(),
      "color": 0xffe98668
    },
    {
      "titulo": "Acero 2:",
      "data": zapata.getPesoAceroAnch(),
      "color": 0xffa95b4f
    },
    {
      "titulo": "Precio Acero:",
      "data": zapata.getPresioAcero(),
      "color": 0xffa95b4f
    },
    {
      "titulo": "Total Precio",
      "data": zapata.getPresioAcero() + concreto.textTotal(),
      "color": 0xffa95b4f
    },
  ];
  return data;
}
