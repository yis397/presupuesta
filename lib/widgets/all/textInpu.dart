// ignore_for_file: file_names
part of "../widget.dart";

class TextInputs extends StatelessWidget {
  final String nombre;
  final String unidad;
  final TextInputType tipo;
  final double anch;
  final int val;
  final int bloc;
  const TextInputs({
    required this.nombre,
    required this.unidad,
    required this.val,
    required this.tipo,
    required this.bloc,
    required this.anch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matBloc = BlocProvider.of<MaterialesBloc>(context);
    final calcBloc = BlocProvider.of<CalculoBloc>(context);
    final recordBloc = BlocProvider.of<RecordatorioBloc>(context);
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: anch,
      child: TextFormField(
          autocorrect: false,
          keyboardType: tipo,
          maxLength: bloc == 3 ? 50 : 8,
          enableSuggestions: false,
          decoration: InputDecorations.authInputDecoration(
            hintText: nombre,
            labelText: "$nombre/$unidad",
          ),
          onChanged: (val) => (bloc == 1
              ? matBloc.setValor(nombre, val)
              : bloc == 2
                  ? calcBloc.setValor(nombre, val)
                  : recordBloc.setvalores(nombre, val)),
          validator: (value) {
            if (value != null && value.length >= val) {
            } else {
              return 'Requerido';
            }
            return null;
          }),
    );
  }
}

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        counterText: "",
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null);
  }
}
