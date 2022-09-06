part of "../widget.dart";

class CalculoLayer extends StatelessWidget {
  const CalculoLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CalculoBloc, CalculoState>(builder: (context, state) {
      return Column(children: [
        HeadC(size, state.nombre!['nombre'] ?? "nom", 2, state.nombre!['img'],
            state.nombre!['datos'],
            height: size.height < 800 ? .32 : .28,
            height2: size.height < 800 ? .18 : .14),
        SizedBox(
          height: size.height *
              (state.i == 3
                  ? size.height < 800
                      ? 70
                      : 0.65
                  : size.height < 800
                      ? .98
                      : 0.55),
          width: size.width,
          child: Column(children: [
            Wrap(alignment: WrapAlignment.spaceBetween, children: [
              Titulo("Ingrese Datos", 20, 7, colores["primario"]!),
              BotIcon("", Icons.help, 25,
                  () => _showMyDialog(context, state.nombre!['ayuda']))
            ]),
            Titulo(state.msg ?? "", 20, 2, colores["primario"]!),
            Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height *
                  (state.i == 3
                      ? size.height < 800
                          ? .80
                          : 0.52
                      : size.height < 800
                          ? 0.75
                          : 0.42),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange.shade50),
              child: Form(
                  key: context.read<CalculoBloc>().formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: (state.i == 3
                              ? size.height < 800
                                  ? 400
                                  : 350
                              : size.height < 800
                                  ? 350
                                  : 270),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * .95,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: formuCalculo[state.i ?? 0][0]),
                              ),
                              const Divider(
                                height: 10,
                              ),
                              SizedBox(
                                width: size.width * .9,
                                child: state.materiales ?? const Text("null"),
                              )
                            ],
                          )),
                      MaterialButton(
                          onPressed: () {
                            if (!context.read<CalculoBloc>().isValidForm()) {
                              return;
                            }
                            context.read<CalculoBloc>().calcular();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color((colores["terciario"]!)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Titulo("Calcula", 15, 4, 0xffFFFFFF),
                          )),
                    ],
                  )),
            )
          ]),
        ),
        SizedBox(
          height: size.height * .5,
          width: size.width * .9,
          child: WResulatdo(state.respuesta ?? []),
        )
      ]);
    });
  }
}

Future<void> _showMyDialog(context, img) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ayuda'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: ClipRRect(
                    child: FadeInImage(
                      placeholder: AssetImage(img),
                      image: AssetImage(img),
                    ),
                  )),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}
