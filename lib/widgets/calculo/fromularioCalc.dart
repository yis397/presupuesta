// ignore_for_file: file_names
part of "../widget.dart";

List<List> formuCalculo = [
  //muros
  [
    Row(children: const [
      TextInputs(
        anch: 70,
        nombre: "Largo",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 70,
        nombre: "Altura",
        val: 1,
        tipo: TextInputType.number,
        unidad: "m",
        bloc: 2,
      ),
      TextInputs(
        anch: 60,
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
    Column(
      children: [
        Row(children: const [
          TextInputs(
            anch: 90,
            nombre: "Largo",
            val: 1,
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
            anch: 86,
            nombre: "Altura",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
        ]),
        const Divider(
          height: 10,
        ),
        Unidad(
          const ["100", "150", "200", "250"],
          "Resistencia",
        )
      ],
    )
  ],
  //zapata
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 63,
            nombre: "Largo",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          const TextInputs(
            anch: 68,
            nombre: "Ancho",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          const TextInputs(
            anch: 63,
            nombre: "Altura",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          Unidad(
            const ["100", "150", "200", "250"],
            "kg/cm2",
          )
        ]),
        Wrap(alignment: WrapAlignment.spaceAround, children: const [
          TextInputs(
            anch: 50,
            nombre: "ly",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "gL",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 85,
            nombre: "e2",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
        ]),
      ],
    ),
  ],

  ///zapata 2

  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 63,
            nombre: "Largo",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          const TextInputs(
            anch: 68,
            nombre: "Ancho",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          const TextInputs(
            anch: 63,
            nombre: "Altura",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          Unidad(
            const ["100", "150", "200", "250"],
            "kg/cm2",
          )
        ]),
        Wrap(alignment: WrapAlignment.spaceAround, children: const [
          TextInputs(
            anch: 50,
            nombre: "ly",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "gL",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 85,
            nombre: "e2",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
        ]),
        Wrap(alignment: WrapAlignment.spaceAround, children: const [
          TextInputs(
            anch: 50,
            nombre: "h2",
            val: 1,
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
    ),
  ],

  //trabe
  [
    Column(
      children: [
        Row(children: [
          const TextInputs(
            anch: 63,
            nombre: "Largo",
            val: 1,
            tipo: TextInputType.number,
            unidad: "m",
            bloc: 2,
          ),
          const TextInputs(
            anch: 68,
            nombre: "Ancho",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          const TextInputs(
            anch: 63,
            nombre: "Altura",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          Unidad(
            const ["100", "150", "200", "250"],
            "kg/cm2",
          )
        ]),
        Wrap(alignment: WrapAlignment.spaceAround, children: const [
          TextInputs(
            anch: 50,
            nombre: "ly",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "gL",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "gE",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "e2",
            val: 1,
            tipo: TextInputType.number,
            unidad: "cm",
            bloc: 2,
          ),
          TextInputs(
            anch: 50,
            nombre: "a1",
            val: 1,
            tipo: TextInputType.number,
            unidad: "un",
            bloc: 2,
          )
        ]),
      ],
    ),
  ],
];
/**
 * Row(children: [
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
          WlstaDesp(
            ["1", "2"],
            "tipo",
          ),

          
        ]),




Titulo("si el tipo es 2", 10, 3, 0xFF888888),
    Row(children: const [
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
 */