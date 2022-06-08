part of "../widget.dart";

List<List> formuCalculo = [
  //muros
  [
    Row(children: [
      TextInputs(
        anch: 90,
        nombre: "Largo",
        val: 2,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 90,
        nombre: "Alto",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 90,
        nombre: "ly",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
    ]),
  ],
  //piso
  [
    Row(children: [
      TextInputs(
        anch: 90,
        nombre: "Largo",
        val: 2,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 90,
        nombre: "Ancho",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 90,
        nombre: "Alto",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
    ]),
  ],
];
