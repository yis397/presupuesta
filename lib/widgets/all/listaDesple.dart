part of "../widget.dart";

class WlstaDesp extends StatefulWidget {
  List<dynamic> lista;
  String nombre;
  int typBloc;
  WlstaDesp(this.lista, this.nombre, this.typBloc, {Key? key})
      : super(key: key);

  @override
  State<WlstaDesp> createState() => _WlstaDespState();
}

class _WlstaDespState extends State<WlstaDesp> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    final matBloc = BlocProvider.of<MaterialesBloc>(context);
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
          dropdownValue = newValue!.toString();
          if (widget.typBloc == 1) {
            matBloc.setValor(widget.nombre, newValue);
          } else {
            final valor = widget.lista
                .firstWhere(((e) => e["id"] == int.parse(newValue)));
            calBloc.setValor(widget.nombre, valor);
          }
        });
      },
      items: widget.lista.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: (widget.typBloc == 1 ? value["nombre"] : value["id"]),
          child: Text(value["nombre"]),
        );
      }).toList(),
    );
  }
}
