class Concreto {
  List<double> concreto = [];
  double mqConcreto = 0;
  double presConcreto = 0;
  double precioCemen = 0;
  double precioArena = 0;
  double precioGrava = 0;
  double totprecioCemen = 0;
  double totprecioArena = 0;
  double totprecioGrava = 0;
  double cantidadCemen = 0;
  double cantidadArena = 0;
  double cantidadGrava = 0;
  double cantidadAgua = 0;
  double area = 0;
  double e = 0;
  String resistencia = "";
  String cemUnidad = "";
  String arenaUnidad = "";
  String gravaUnidad = "";
  List<double> selConcreto = [];
  double totalPrecio = 0;
/**0 cemento,1 grava, 2 arena, 3 agua */

  Concreto(
      {required this.mqConcreto,
      required this.cemUnidad,
      required this.precioCemen,
      required this.arenaUnidad,
      required this.precioArena,
      required this.gravaUnidad,
      required this.precioGrava,
      required this.resistencia}) {
    tipoConcreto();
    calculoPrecios();

    totalPrecio = totprecioArena + totprecioCemen + totprecioGrava;
  }
  getConcre150(double mq) {
    print("150");
    cantidadCemen = 279 * mq;
    cantidadGrava = 0.559 * mq;
    cantidadArena = 0.388 * mq;
    cantidadAgua = 0.187 * mq;
  }

  getConcre200(double mq) {
    print("200");
    cantidadCemen = 317 * mq;
    cantidadGrava = 0.733 * mq;
    cantidadArena = 0.388 * mq;
    cantidadAgua = 0.187 * mq;
  }

  getConcre100(double mq) {
    print("100");
    cantidadCemen = 246 * mq;
    cantidadGrava = 0.733 * mq;
    cantidadArena = 0.578 * mq;
    cantidadAgua = 0.187 * mq;
  }

  getConcre250(double mq) {
    print("2500");
    cantidadCemen = 374 * mq;
    cantidadGrava = 0.733 * mq;
    cantidadArena = 0.505 * mq;
    cantidadAgua = 0.187 * mq;
  }

  tipoConcreto() {
    switch (resistencia) {
      case "100":
        getConcre100(mqConcreto);
        break;
      case "150":
        getConcre150(mqConcreto);
        break;
      case "200":
        getConcre200(mqConcreto);
        break;
      default:
        getConcre100(mqConcreto);
    }
    return;
  }

  calculoPrecios() {
    cemUnidad == "ton"
        ? totprecioCemen = precioCemen * (cantidadCemen / 1000)
        : totprecioCemen = (cantidadCemen / 50) * precioCemen;

    arenaUnidad == "m3"
        ? totprecioArena = precioArena * cantidadArena
        : totprecioArena = ((1500 * cantidadArena) * precioArena) / 1500;

    gravaUnidad == "m3"
        ? totprecioGrava = precioGrava * cantidadGrava
        : totprecioGrava = ((1800 * cantidadGrava) * precioGrava) / 1800;
    return;
  }

  textCemento() {
    return "${(cantidadCemen).toStringAsFixed(1)}/kg";
  }

  textArena() {
    return "${(cantidadArena).toStringAsFixed(2)}/m3";
  }

  textGrava() {
    return "${(cantidadGrava).toStringAsFixed(2)}/m3";
  }

  textAgua() {
    return "${(cantidadAgua).toStringAsFixed(2)}/m3";
  }

  textTotal() {
    return "${(totalPrecio).toStringAsFixed(1)}/mn";
  }
}
