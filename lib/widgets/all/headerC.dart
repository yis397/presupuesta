part of "../widget.dart";

class HeadC extends StatelessWidget {
  final Size size;
  final String text1;

  const HeadC(this.size, this.text1, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * .27,
      child: Stack(children: [
        Column(
          children: [
            intStack(size),
            Container(
              height: size.height * .13,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Text(
                    "Sint non anim deserunt nostrud nisi officia consequat esse voluptate minim veniam.Sint non anim deserunt nostrud nisi officia consequat esse voluptate minim veniam."),
              ),
            )
          ],
        ),
        Column(
          children: [
            Divider(
              height: size.height * .11,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
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
                    width: size.width * .6,
                    decoration: const BoxDecoration(
                        color: Color(0xffC7594A),
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                    child: Titulo(text1, 20, 3, 0xffFFDF7A))
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
  const intStack(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int imag = 0;
    List<Map<String, dynamic>> list = [];
    return Container(
      height: size.height * .14,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/muro.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90))),
    );
  }
}
