// ignore_for_file: file_names, must_be_immutable
part of "../widget.dart";

class WlstaDesp extends StatefulWidget {
  List<dynamic> lista;
  String nombre;

  WlstaDesp(this.lista, this.nombre, {Key? key}) : super(key: key);

  @override
  State<WlstaDesp> createState() => _WlstaDespState();
}

class _WlstaDespState extends State<WlstaDesp> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    final calBloc = BlocProvider.of<CalculoBloc>(context);
    return DropdownButton<String>(
      hint: Column(
        children: [
          Text(widget.nombre),
          Text(dropdownValue),
        ],
      ),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          final valor = widget.lista
              .firstWhere(((e) => e["id"] == int.parse(newValue!.toString())));
          dropdownValue = valor["nombre"];
          calBloc.setValor(widget.nombre, valor);
        });
      },
      items: widget.lista.map((dynamic value) {
        return DropdownMenuItem<String>(
          value: value["id"].toString(),
          child: Text(value["nombre"]),
        );
      }).toList(),
    );
  }
}
