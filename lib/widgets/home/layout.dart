part of "../widget.dart";

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        HeaderHom(size: size),
        SizedBox(
          height: 20,
        ),
        Carrusel(
            size: size,
            lista: [
              {"nom": "columna", "index": 0}
            ],
            frx: .7,
            tipo: 2),
        SizedBox(
          height: 20,
        ),
        Container(
          height: size.height * .1,
          child: BotIcon("Add Material", Icons.add_circle, 45,
              () => Navigator.pushNamed(context, "material")),
        )
      ],
    );
  }
}

class HeaderHom extends StatelessWidget {
  const HeaderHom({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      height: size.height * .4,
      width: size.width,
      decoration: BoxDecoration(
          color: Color(colores["primario"]!),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(100))),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Titulo("Presupuesta", 30, 10, colores["secundario"]!),
        SizedBox(
          height: size.height * .15,
        ),
        Titulo("Elementos:", 15, 5, colores["secundario"]!),
        SizedBox(
          height: size.height * .02,
        ),
      ]),
    );
  }
}
