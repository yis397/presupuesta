// ignore_for_file: file_names

part of './helpers.dart';

List<Map<String, dynamic>> calculoTrabe(
    String aceroLong,
    String aceroEstri,
    double pesoaceroLong,
    double pesoaceroEstri,
    double recubr,
    double ancho,
    double altura,
    double largo,
    double separacionEst,
    double ganchoEst,
    double ganchoLong,
    double aceroEstriPrec,
    double aceroLongPrec,
    double numVarLong,
    Map cemento,
    Map arena,
    Map grava,
    String resistencia) {
  Concreto concreto;
  List<Map<String, dynamic>> data = [];
  AceroAbilitado acero;
  acero = AceroAbilitado(
    aceroLong: aceroLong,
    aceroEstri: aceroEstri,
    pesoaceroLong: pesoaceroLong,
    pesoaceroEstri: pesoaceroEstri,
    recubr: recubr,
    base: ancho,
    altura: altura,
    largo: largo,
    separacionEst: separacionEst,
    ganchoEst: ganchoEst,
    ganchoLong: ganchoLong,
    numVarLong: numVarLong,
    aceroEstriPrec: aceroEstriPrec,
    aceroLongPrec: aceroLongPrec,
  );
  concreto = Concreto(
      mqConcreto: (ancho / 100) * (altura / 100) * largo,
      cemUnidad: cemento['unidad'],
      precioCemen: cemento['precio'],
      arenaUnidad: arena['unidad'],
      precioArena: arena['precio'],
      gravaUnidad: grava['unidad'],
      precioGrava: grava['precio'],
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
    {
      "titulo": "Peso longi:",
      "data": acero.textAcerLong(),
      "color": 0xfffffc089
    },
    {
      "titulo": "Peso estribos:",
      "data": acero.textEstribo(),
      "color": 0xffe98668
    },
    {
      "titulo": "Precio Acero:",
      "data": acero.textPrecio(),
      "color": 0xffa95b4f
    },
  ];
  return data;
}
