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
    WlstaDesp(["100", "150", "200", "250"], "Resistencia", 2)
  ],
  //zapata
  [
    Row(children: [
      TextInputs(
        anch: 70,
        nombre: "Largo",
        val: 2,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 70,
        nombre: "Ancho",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 70,
        nombre: "Alto",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      WlstaDesp(["100", "150", "200", "250"], "Resistencia", 2)
    ]),
    Row(children: [
      TextInputs(
        anch: 50,
        nombre: "ly",
        val: 2,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
      TextInputs(
        anch: 50,
        nombre: "ganch",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
      TextInputs(
        anch: 50,
        nombre: "separacion",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
      WlstaDesp(["1", "2"], "tipo", 2)
    ]),
    Titulo("si el tipo es 2", 10, 3, 0xFF888888),
    Row(children: [
      TextInputs(
        anch: 50,
        nombre: "h2",
        val: 2,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
      TextInputs(
        anch: 50,
        nombre: "a1",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
      TextInputs(
        anch: 50,
        nombre: "b1",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 2,
      ),
    ])
  ],
];
