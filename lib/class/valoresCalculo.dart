import 'package:prestpuesta/widgets/widget.dart';

class ValoresCalculo {
  Map<String, dynamic> valores = {
    "Ancho": "",
    "Altura": "",
    "Largo": "",
    "Resistencia": "",
    "ly": "",
    "bloque": {},
    "arena": {},
    "cemento": {},
  };
  ValoresCalculo();

  setValor(String nombre, dynamic valor) {
    valores[nombre] = valor;
  }

  resetValor() {
    valores = {
      "Ancho": "",
      "Altura": "",
      "Largo": "",
      "Resistencia": "",
      "ly": "",
      "bloque": {},
      "arena": {},
      "cemento": {},
    };
  }

  bool muroValid() {
    if (valores["bloque"]["id"] > 1 &&
        valores["cemento"]["id"] > 1 &&
        valores["arena"]["id"] > 1) {
      return true;
    }
    return false;
  }

  bool concretoValid() {
    if (valores["grava"]["id"] > 1 &&
        valores["cemento"]["id"] > 1 &&
        valores["arena"]["id"] > 1) {
      return true;
    }
    return false;
  }
}
