part of "../widget.dart";

class CalculoLayer extends StatelessWidget {
  const CalculoLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CalculoBloc, CalculoState>(builder: (context, state) {
      return Column(children: [
        HeadC(size, state.nombre!['nombre'] ?? "nom", 2, state.nombre!['img']),
        SizedBox(
          height: size.height * (state.i == 3 ? 0.65 : 0.55),
          width: size.width,
          child: Column(children: [
            Wrap(alignment: WrapAlignment.spaceBetween, children: [
              Titulo("Ingrese Datos", 20, 7, colores["primario"]!),
              BotIcon("", Icons.ads_click_sharp, 25,
                  () => _showMyDialog(context, state.nombre!['ayuda']))
            ]),
            Titulo(state.msg ?? "", 20, 2, colores["primario"]!),
            Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * (state.i == 3 ? 0.52 : 0.42),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey),
              child: Form(
                  key: context.read<CalculoBloc>().formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: (state.i == 3 ? 350 : 270),
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
                            child: Titulo("Guardar", 15, 4, 0xffFFFFFF),
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
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage(img),
                      image: AssetImage(img),
                      fit: BoxFit.cover,
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
