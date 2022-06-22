// ignore_for_file: file_names

class AceroAbilitado {
  String aceroLong = "";
  String aceroEstri = "";
  double aceroLongPrec = 0;
  double aceroEstriPrec = 0;
  double totAceroPrec = 0;

  double pesoaceroLong = 0;
  double pesoaceroEstri = 0;
  double totPesoaceroLong = 0;
  double totPesoaceroEstri = 0;
  double recubr = 0;
  double base = 0;
  double altura = 0;
  double largo = 0;
  double separacionEst = 0;
  double ganchoEst = 0;
  double ganchoLong = 0;
  double numVarLong = 0;

  AceroAbilitado({
    required this.aceroLong,
    required this.aceroEstri,
    required this.pesoaceroLong,
    required this.pesoaceroEstri,
    required this.recubr,
    required this.base,
    required this.altura,
    required this.largo,
    required this.separacionEst,
    required this.ganchoEst,
    required this.ganchoLong,
    required this.numVarLong,
    required this.aceroEstriPrec,
    required this.aceroLongPrec,
  }) {
    longituAcero();
    precios();
  }
  void aceroTra() {}

  void longituAcero() {
    double longiAcer = largo - (2 * (recubr / 100)) + (2 * (ganchoLong / 100));
    double longiEstribo = (((base / 100) - ((recubr / 100) * 2)) * 2) +
        (((altura / 100) - ((recubr / 100) * 2)) * 2) +
        (2 * (ganchoEst / 100));

    totPesoaceroLong = longiAcer * numVarLong * pesoaceroLong;
    totPesoaceroEstri =
        longiEstribo * (largo / (separacionEst / 100)) * pesoaceroEstri;
  }

  void precios() {
    totAceroPrec = (totPesoaceroEstri * aceroEstriPrec) +
        (totPesoaceroLong * aceroLongPrec);
    totAceroPrec /= 1000;
  }

  String textAcerLong() {
    return "${(totPesoaceroLong).toStringAsFixed(1)}/kg";
  }

  String textEstribo() {
    return "${(totPesoaceroEstri).toStringAsFixed(1)}/kg";
  }

  String textPrecio() {
    return "\$${(totAceroPrec).toStringAsFixed(1)}";
  }
}

class AceroZapa {
  double ganchoLong = 0;
  double dimaceroAnch = 0;
  double largo = 0;
  double ancho = 0;
  double rec = 0;
  double longUnAncho = 0;
  double longUnLong = 0;
  double separacion = 0;
  double totlong = 0;
  double totAnch = 0;
  double pesoAncho = 0;
  double pesoLargo = 0;
  double precioAncho = 0;
  double precioLargo = 0;
  double totprecioAncho = 0;
  double totprecioLargo = 0;

  AceroZapa({
    required this.ganchoLong,
    required this.largo,
    required this.ancho,
    required this.rec,
    required this.separacion,
    required this.pesoAncho,
    required this.pesoLargo,
    required this.precioAncho,
    required this.precioLargo,
  }) {
    aceroAbi();
  }

  aceroAbi() {
    longUnAncho = ((rec / 100) * 2) - ancho + ((ganchoLong / 100) * 2);
    longUnLong = ((rec / 100) * 2) - largo + ((ganchoLong / 100) * 2);
    totlong = ((((rec / 100) * 2) - largo) / (separacion / 100)) *
        longUnLong *
        pesoLargo;
    totAnch = ((((rec / 100) * 2) - ancho) / (separacion / 100)) *
        longUnAncho *
        pesoAncho;

    totprecioAncho = totAnch * precioAncho;
    totprecioLargo = totlong * precioLargo;
  }

  String getPesoAceroAnch() {
    return "${(totAnch).toStringAsFixed(2)}/kg";
  }

  String getPesoAceroLong() {
    return "${(totlong).toStringAsFixed(2)}/kg";
  }

  String getPresioAcero() {
    return "${(totprecioAncho + totprecioLargo).toStringAsFixed(1)}/kg";
  }
}
