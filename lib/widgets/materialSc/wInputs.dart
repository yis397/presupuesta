part of "../widget.dart";

class WForm extends StatelessWidget {
  const WForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialesBloc, MaterialesState>(
      builder: (context, state) {
        return SizedBox(
          height: 300,
          child: Form(
              key: context.read<MaterialesBloc>().formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: bloques[state.i!].length,
                        itemBuilder: (BuildContext context, int index) {
                          return bloques[state.i!][index];
                        }),
                  ),
                  MaterialButton(
                      onPressed: () {
                        if (!context.read<MaterialesBloc>().isValidForm())
                          return;
                        context.read<MaterialesBloc>().setValores();
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
                      context.read<MaterialesBloc>().get();
                    },
                    child: Text("CLICK"),
                  )
                ],
              )),
        );
      },
    );
  }
}
