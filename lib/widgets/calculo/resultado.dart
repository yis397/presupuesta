part of "../widget.dart";

class WResulatdo extends StatelessWidget {
  final List<Map<String, dynamic>> datos;
  const WResulatdo(
    this.datos, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (datos.isEmpty) {
      return const Center(
        child: SizedBox(
          child: Text("No has hecho un calculo"),
        ),
      );
    }
    return ListView.builder(
        itemCount: datos.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              WCitemResult(datos[index]["color"], datos[index]["titulo"],
                  datos[index]["data"].toString()),
              const Divider(
                height: 15,
              )
            ],
          );
        });
  }
}

class WCitemResult extends StatelessWidget {
  final int color;
  final String tiulo;
  final String dato;
  const WCitemResult(
    this.color,
    this.tiulo,
    this.dato, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(seconds: 2),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(color), borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          title: Titulo(tiulo, 20, 2, 0xfff0f0ec),
          trailing: Titulo(dato, 15, 2, 0xfff0f0ec),
        ),
      ),
    );
  }
}
