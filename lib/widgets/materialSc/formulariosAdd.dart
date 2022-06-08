part of '../widget.dart';

List<List> bloques = [
  [
    Row(children: [
      TextInputs(
        anch: 90,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      TextInputs(
        anch: 90,
        nombre: "precio",
        val: 1,
        tipo: TextInputType.number,
        unidad: "mn",
        bloc: 1,
      ),
      WlstaDesp(["pza", "mill"], "unidad", 1)
    ]),
    Row(children: [
      TextInputs(
        anch: 100,
        nombre: "Ancho",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 1,
      ),
      TextInputs(
        anch: 100,
        nombre: "Altura",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 1,
      ),
      TextInputs(
        anch: 100,
        nombre: "Largo",
        val: 1,
        tipo: TextInputType.number,
        unidad: "cm",
        bloc: 1,
      ),
    ]),
  ],
//cementos
  [
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      WlstaDesp(["ton", "50kg"], "unidad", 1)
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
      unidad: "mn",
      bloc: 1,
    ),
  ],

  //arena
  [
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      WlstaDesp(["ton", "m3"], "unidad", 1)
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
      unidad: "mn",
      bloc: 1,
    ),
  ],
  //grava
  [
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      WlstaDesp(["ton", "m3"], "unidad", 1)
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
      unidad: "mn",
      bloc: 1,
    ),
  ],
//varilla
  [
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      WlstaDesp(["ton", "m3"], "unidad", 1)
    ]),
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "precio",
        val: 1,
        tipo: TextInputType.number,
        unidad: "mn",
        bloc: 1,
      ),
      WlstaDesp(["1/4", "1/8"], "calibre", 1)
    ]),
  ],
//piedras
  [
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
        unidad: "",
        bloc: 1,
      ),
      WlstaDesp(["ton", "m3"], "unidad", 1)
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
      unidad: "mn",
      bloc: 1,
    ),
  ],
];
