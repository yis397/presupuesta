part of "../widget.dart";

class Carrusel extends StatelessWidget {
  const Carrusel({
    Key? key,
    required this.size,
    required this.lista,
    required this.tipo,
    required this.frx,
  }) : super(key: key);

  final Size size;
  final List lista;
  final int tipo;
  final double frx;

  @override
  Widget build(BuildContext context) {
    final matBloc = BlocProvider.of<MaterialesBloc>(context);
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: frx,
          height: 200,
          onPageChanged: (i, ch) => {
                if (tipo == 1)
                  {matBloc.add(onSeleccionIndx(i))}
                else
                  {print("hola")}
              }),
      items: lista.map((i) {
        return Builder(builder: (BuildContext context) {
          return (tipo == 1
              ? ItemMaterial(
                  nom: i["nom"],
                )
              : ItemHome(
                  i: i["index"],
                  titulo: i["nom"],
                ));
        });
      }).toList(),
    );
  }
}

class ItemMaterial extends StatelessWidget {
  const ItemMaterial({
    Key? key,
    required this.nom,
  }) : super(key: key);
  final String nom;

  @override
  Widget build(BuildContext context) {
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
        return Container(
            alignment: Alignment.center,
            width: 80,
            decoration: BoxDecoration(
                color: (nom == list[state.i!]["nom"]
                    ? Color(colores["terciario"]!)
                    : Color.fromARGB(255, 108, 122, 145)),
                borderRadius: BorderRadius.circular(20)),
            child: Text(nom));
      },
    );
  }
}

class ItemHome extends StatelessWidget {
  const ItemHome({required this.titulo, required this.i, Key? key})
      : super(key: key);
  final String titulo;
  final int i;

  @override
  Widget build(BuildContext context) {
    final matBloc = BlocProvider.of<CalculoBloc>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      width: size.width * .7,
      child: MaterialButton(
          onPressed: () {
            matBloc.selectCalculo(0);
            Navigator.pushNamed(context, "calculo");
          },
          child: Container(
            height: size.height * .25,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amber,
            ),
            child: Text(titulo),
          )),
    );
  }
}
