part of '../widget.dart';

List<List> bloques = [
  [
    Row(children: [
      TextInputs(
        anch: 90,
        nombre: "nombre",
        val: 2,
        tipo: TextInputType.text,
      ),
      TextInputs(
        anch: 90,
        nombre: "precio",
        val: 1,
        tipo: TextInputType.number,
      ),
      WlstaDesp(["pza", "mill"], "unidad")
    ]),
    Row(children: [
      TextInputs(
        anch: 100,
        nombre: "Ancho",
        val: 1,
        tipo: TextInputType.number,
      ),
      TextInputs(
        anch: 100,
        nombre: "Altura",
        val: 1,
        tipo: TextInputType.number,
      ),
      TextInputs(
        anch: 100,
        nombre: "Largo",
        val: 1,
        tipo: TextInputType.number,
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
      ),
      WlstaDesp(["ton", "50kg"], "unidad")
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
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
      ),
      WlstaDesp(["ton", "m3"], "unidad")
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
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
      ),
      WlstaDesp(["ton", "m3"], "unidad")
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
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
      ),
      WlstaDesp(["ton", "m3"], "unidad")
    ]),
    Row(children: [
      TextInputs(
        anch: 250,
        nombre: "precio",
        val: 1,
        tipo: TextInputType.number,
      ),
      WlstaDesp(["1/4", "1/8"], "calibre")
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
      ),
      WlstaDesp(["ton", "m3"], "unidad")
    ]),
    TextInputs(
      anch: 250,
      nombre: "precio",
      val: 1,
      tipo: TextInputType.number,
    ),
  ],
];
