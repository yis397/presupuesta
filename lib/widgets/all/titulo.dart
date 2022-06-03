part of "../widget.dart";

Widget Titulo(String texto, double size, double sep, int color) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: "Opensans",
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Color(color),
        letterSpacing: sep),
  );
}
