// ignore_for_file: file_names
part of 'helpers.dart';

List<Map<String, dynamic>> calculoPiso(
  double area,
  double e,
  String resistencia,
  Map cemento,
  Map arena,
  Map grava,
) {
  List<Map<String, dynamic>> data = [];

  Concreto concreto = Concreto(
      mqConcreto: area * (e / 100),
      cemUnidad: cemento['unidad'],
      precioCemen: cemento['precio'],
      arenaUnidad: arena['unidad'],
      precioArena: arena['precio'],
      gravaUnidad: grava['unidad'],
      precioGrava: grava['precio'],
      resistencia: resistencia);

  data = [
    {
      'titulo': 'Total Cemento:',
      'data': concreto.textCemento(),
      'color': 0xfffffc089
    },
    {
      'titulo': 'Total Arena:',
      'data': concreto.textArena(),
      'color': 0xffe98668
    },
    {
      'titulo': 'Total Grava:',
      'data': concreto.textGrava(),
      'color': 0xffa95b4f
    },
    {'titulo': 'Total Agua:', 'data': concreto.textAgua(), 'color': 0xffa95b4f},
    {'titulo': 'Precio Tot:', 'data': concreto.textTotal(), 'color': 0xffa95b4f}
  ];

  return data;
}
