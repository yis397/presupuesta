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
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: anch,
      child: TextFormField(
          autocorrect: false,
          keyboardType: tipo,
          decoration: InputDecorations.authInputDecoration(
            hintText: "$nombre/$unidad",
            labelText: nombre,
          ),
          onChanged: (val) => (bloc == 1
              ? matBloc.setValor(nombre, val)
              : calcBloc.setValor(nombre, val)),
          validator: (value) {
            if (value != null && value.length >= val) {
            } else {
              return 'Requerido';
            }
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
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null);
  }
}
