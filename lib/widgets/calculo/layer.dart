part of "../widget.dart";

class CalculoLayer extends StatelessWidget {
  const CalculoLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int i;
    return Column(
      children: [
        HeadC(size, "Calculo"),
        Container(
          height: size.height * .4,
          width: size.width,
          alignment: Alignment.center,
          child: Column(children: [
            Titulo("Ingrese Datos", 20, 7, colores["primario"]!),
            Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * .32,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey),
              child: Form(
                  key: context.read<MaterialesBloc>().formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: formuCalculo[0].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  formuCalculo[0][index],
                                  SelectMaterials()
                                ],
                              );
                            }),
                      ),
                      MaterialButton(
                          onPressed: () {
                            if (!context.read<MaterialesBloc>().isValidForm())
                              return;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color((colores["terciario"]!)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Titulo("Guardar", 15, 4, 0xffFFFFFF),
                          )),
                      MaterialButton(
                        onPressed: () {
                          //context.read<MaterialesBloc>().get();
                        },
                        child: Text("CLICK"),
                      )
                    ],
                  )),
            )
          ]),
        )
      ],
    );
  }
}

class SelectMaterials extends StatelessWidget {
  const SelectMaterials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        WlstaDesp(["a", "e"]),
        SizedBox(
          width: 20,
        ),
        WlstaDesp(["a", "e"]),
        SizedBox(
          width: 20,
        ),
        WlstaDesp(["a", "e"]),
        SizedBox(
          width: 20,
        ),
        WlstaDesp(["a", "e"]),
      ],
    );
  }
}
