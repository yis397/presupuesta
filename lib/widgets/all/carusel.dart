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
    final calBloc = BlocProvider.of<CalculoBloc>(context);
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: frx,
          height: 200,
          onPageChanged: (i, ch) => {
                if (tipo == 1)
                  {matBloc.add(OnSeleccionIndx(i))}
                else
                  {calBloc.selectCalculo(i)}
              }),
      items: lista.map((i) {
        return Builder(builder: (BuildContext context) {
          return (tipo == 1
              ? ItemMaterial(
                  nom: i["nom"],
                )
              : ItemHome(
                  i: i["id"],
                  titulo: i["nombre"],
                  img: i['img'],
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
                    : const Color.fromARGB(255, 108, 122, 145)),
                borderRadius: BorderRadius.circular(20)),
            child: Text(nom));
      },
    );
  }
}

class ItemHome extends StatelessWidget {
  const ItemHome(
      {required this.titulo, required this.img, required this.i, Key? key})
      : super(key: key);
  final String titulo;
  final int i;
  final String img;

  @override
  Widget build(BuildContext context) {
    final matBloc = BlocProvider.of<CalculoBloc>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * .2,
        width: size.width * .7,
        child: MaterialButton(
            onPressed: () {
              matBloc.selectCalculo(i);
              Navigator.pushNamed(context, "calculo");
            },
            child: Stack(children: [
              Container(
                  height: size.height * .25,
                  width: 300,
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
              Container(
                margin: EdgeInsets.only(top: size.height < 1950 ? 130 : 180),
                width: size.width * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(colores["terciario"]!)),
                child: Titulo(titulo, 14, 3, colores["secundario"]!),
              )
            ])));
  }
}
