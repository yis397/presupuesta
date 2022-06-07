part of "../widget.dart";

class WlstaDesp extends StatefulWidget {
  List<String> lista;
  String nombre;
  WlstaDesp(this.lista, this.nombre, {Key? key}) : super(key: key);

  @override
  State<WlstaDesp> createState() => _WlstaDespState();
}

class _WlstaDespState extends State<WlstaDesp> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    list.addAll(widget.lista);
    final matBloc = BlocProvider.of<MaterialesBloc>(context);
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
          dropdownValue = newValue!;
          matBloc.setValor("unidad", newValue);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
