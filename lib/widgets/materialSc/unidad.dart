// ignore_for_file: must_be_immutable

part of "../widget.dart";

class Unidad extends StatefulWidget {
  List<dynamic> lista;
  String nombre;
  Unidad(this.lista, this.nombre, {Key? key}) : super(key: key);

  @override
  State<Unidad> createState() => _UnidadState();
}

class _UnidadState extends State<Unidad> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
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

          matBloc.setValor(widget.nombre, newValue);
        });
      },
      items: widget.lista.map((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
