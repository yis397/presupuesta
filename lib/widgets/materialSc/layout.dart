part of "../widget.dart";

class LayoutMat extends StatelessWidget {
  const LayoutMat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Map<String, String>> list = [
      {"nom": "bloques"},
      {"nom": "Cementos"},
      {"nom": "Arena"},
      {"nom": "Grava"},
      {"nom": "Varillas"},
      {"nom": "Piedras"},
    ];
    return BlocBuilder<MaterialesBloc, MaterialesState>(
      builder: (context, state) {
        List<dynamic> lista = state.materiales ?? [];

        return Column(
          children: [
            HeadC(size, "titulo", 1, 'assets/img/muro.jpg'),
            SizedBox(
              height: size.height * .07,
              child: Carrusel(
                size: size,
                lista: list,
                tipo: 1,
                frx: .3,
              ),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            const FormAdd(data: WForm(), icon: Icons.storage),
            ListView.builder(
              shrinkWrap: true,
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return lista.isEmpty
                    ? Titulo("Sin MATERIALES", 20, 2, 0xff682736)
                    : ListTile(
                        leading: const Icon(Icons.my_location_rounded),
                        title: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.5,
                              child: Titulo(
                                  lista[index]["nombre"], 15, 1, 0xffC7594A),
                            ),
                            index != 0
                                ? IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      context
                                          .read<MaterialesBloc>()
                                          .deletMaterial(lista[index]["id"]);
                                    },
                                  )
                                : const Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                  )
                          ],
                        ),
                      );
              },
            )
          ],
        );
      },
    );
  }
}
