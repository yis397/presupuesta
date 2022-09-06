// ignore_for_file: file_names

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
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: bloques[state.i!][0],
                      )),
                  MaterialButton(
                      onPressed: () {
                        if (!context.read<MaterialesBloc>().isValidForm()) {
                          return;
                        }

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
                  /*  MaterialButton(
                    onPressed: () {
                      context.read<MaterialesBloc>().delet();
                    },
                    child: const Text("CLICK"),
                  ) */
                ],
              )),
        );
      },
    );
  }
}
