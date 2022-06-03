part of "../widget.dart";

class BotIcon extends StatelessWidget {
  final Function function;
  final String titulo;
  final double tama;
  final IconData icono;
  const BotIcon(this.titulo, this.icono, this.tama, this.function, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            onPressed: () => function(),
            child: Icon(
              icono,
              size: tama,
              color: Color(0xff682736),
            )),
        Titulo(titulo, 15, 2, 0xff682736)
      ],
    );
  }
}
