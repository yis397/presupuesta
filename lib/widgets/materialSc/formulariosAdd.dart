// ignore_for_file: file_names

part of '../widget.dart';

List<List> bloques = [
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 120,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          const TextInputs(
            anch: 100,
            nombre: 'precio',
            val: 1,
            tipo: TextInputType.number,
            unidad: 'mn',
            bloc: 1,
          ),
          Unidad(const ['pza', 'mill'], 'unidad')
        ]),
        Row(children: const [
          TextInputs(
            anch: 100,
            nombre: 'Ancho',
            val: 1,
            tipo: TextInputType.number,
            unidad: 'cm',
            bloc: 1,
          ),
          TextInputs(
            anch: 100,
            nombre: 'Altura',
            val: 1,
            tipo: TextInputType.number,
            unidad: 'cm',
            bloc: 1,
          ),
          TextInputs(
            anch: 90,
            nombre: 'Largo',
            val: 1,
            tipo: TextInputType.number,
            unidad: 'cm',
            bloc: 1,
          ),
        ]),
      ],
    )
  ],
//cementos
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 250,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          Unidad(
            const ['ton', '50kg'],
            'unidad',
          )
        ]),
        const TextInputs(
          anch: 100,
          nombre: 'precio',
          val: 1,
          tipo: TextInputType.number,
          unidad: 'mn',
          bloc: 1,
        ),
      ],
    )
  ],

  //arena
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 250,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          Unidad(const ['ton', 'm3'], 'unidad')
        ]),
        const TextInputs(
          anch: 100,
          nombre: 'precio',
          val: 1,
          tipo: TextInputType.number,
          unidad: 'mn',
          bloc: 1,
        ),
      ],
    )
  ],
  //grava
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 250,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          Unidad(const ['ton', 'm3'], 'unidad')
        ]),
        const TextInputs(
          anch: 100,
          nombre: 'precio',
          val: 1,
          tipo: TextInputType.number,
          unidad: 'mn',
          bloc: 1,
        ),
      ],
    )
  ],
//varilla
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 250,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          Unidad(const ['ton'], 'unidad')
        ]),
        Row(children: [
          const TextInputs(
            anch: 100,
            nombre: 'precio',
            val: 1,
            tipo: TextInputType.number,
            unidad: 'mn',
            bloc: 1,
          ),
          Unidad(
            const ['1/4', '3/8', '1/2', '5/8', '3/4'],
            'pulgada',
          )
        ]),
      ],
    )
  ],
//piedras
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 250,
            nombre: 'nombre',
            val: 2,
            tipo: TextInputType.text,
            unidad: '',
            bloc: 1,
          ),
          Unidad(const ['ton', 'm3'], 'unidad')
        ]),
        const TextInputs(
          anch: 100,
          nombre: 'precio',
          val: 1,
          tipo: TextInputType.number,
          unidad: 'mn',
          bloc: 1,
        ),
      ],
    )
  ],
];
