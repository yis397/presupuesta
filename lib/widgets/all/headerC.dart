// ignore_for_file: file_names, camel_case_types
part of "../widget.dart";

class HeadC extends StatelessWidget {
  final Size size;
  final int tipo;
  final String text1;
  final String img;
  final String dato;
  final double height;
  final double height2;

  const HeadC(this.size, this.text1, this.tipo, this.img, this.dato,
      {Key? key, this.height = .38, this.height2 = .23})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calBloc = BlocProvider.of<CalculoBloc>(context);
    return SizedBox(
      width: size.width,
      height: size.height * height,
      child: Stack(children: [
        Column(
          children: [
            intStack(size, img),
            SizedBox(
              height: size.height * height2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(dato),
              ),
            )
          ],
        ),
        Column(
          children: [
            Divider(
              height: size.height * .11,
              color: const Color.fromARGB(0, 255, 255, 255),
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () => {
                    if (tipo != 1) {calBloc.add(OnReset())},
                    FocusManager.instance.primaryFocus?.unfocus(),
                    Timer(const Duration(seconds: 1),
                        () => Navigator.pop(context))
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: Color(0xff682736),
                  ),
                ),
                SizedBox(
                  width: size.width * .17,
                ),
                Container(
                    alignment: Alignment.center,
                    height: size.height * .05,
                    width:
                        size.height < 1950 ? size.width * 0.5 : size.width * .6,
                    decoration: const BoxDecoration(
                        color: Color(0xffC7594A),
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                    child: Titulo(text1, 15, 3, 0xffFFDF7A))
              ],
            )
          ],
        )
      ]),
    );
  }
}

class intStack extends StatelessWidget {
  final Size size;
  final String img;
  const intStack(this.size, this.img, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .14,
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90))),
    );
  }
}
