part of "../widget.dart";

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _bloc = BlocProvider.of<RecordatorioBloc>(context);
    return Column(
      children: [
        HeaderHom(size: size),
        SizedBox(
          height: size.height < 1950 ? 15 : 20,
        ),
        Carrusel(size: size, lista: obraNegra, frx: .7, tipo: 2),
        SizedBox(
          height: size.height < 1950 ? 5 : 20,
        ),
        SizedBox(
          height: size.height < 1950 ? size.height * 0.13 : size.height * .1,
          child: BotIcon("Agrega Material", Icons.add_circle, 45,
              () => navegacion(context)),
        ),
        Divider(
          height: size.height * 0.05,
        ),
        Container(
          width: size.width * 0.6,
          height: size.height * .08,
          decoration: BoxDecoration(
              color: const Color(0xff682736),
              borderRadius: BorderRadius.circular(20)),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Titulo('', 12, 3, colores["secundario"]!),
              ),
              Container(
                height: size.height * .08,
                width: 5,
                color: Colors.white,
              ),
              MaterialButton(
                onPressed: () => {
                  _bloc.init(),
                  Navigator.pushNamed(context, "recuerda"),
                },
                child: Titulo('Recuerda', 12, 3, colores["secundario"]!),
              )
            ],
          ),
        )
      ],
    );
  }

  navegacion(BuildContext context) {
    final matBloc = BlocProvider.of<MaterialesBloc>(context);
    matBloc.add(OnSeleccionIndx(0));
    Navigator.pushNamed(context, "material");
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
      height: size.height < 800 ? size.height * 0.3 : size.height * .4,
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
