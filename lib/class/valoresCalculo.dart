// ignore_for_file: file_names

class ValoresCalculo {
  Map<String, dynamic> valores = {
    'Ancho': '',
    'Altura': '',
    'Largo': '',
    'Resistencia': '',
    'ly': '',
    'bloque': {},
    'arena': {},
    'cemento': {},
    'aceroLong': {},
    'estribo': {},
    'acero-anch': {},
    'e2': '',
    'gL': '',
    'gE': '',
    'h2': '1.1',
    'h3': '1.1',
    'a1': '1.1',
    'b1': '1.1',
    'tipo': '',
  };
  ValoresCalculo();

  setValor(String nombre, dynamic valor) {
    valores[nombre] = valor;
  }

  Map getValor(int i) {
    switch (i) {
      case 0:
        return {
          'ly': double.parse(valores['ly']),
          'bloque': valores['bloque'],
          'arena': valores['arena'],
          'cemento': valores['cemento'],
          'area':
              double.parse(valores['Altura']) * double.parse(valores['Largo']),
        };
      case 1:
        return {
          'alto': double.parse(valores['Altura']),
          'bloque': valores['bloque'],
          'arena': valores['arena'],
          'cemento': valores['cemento'],
          'grava': valores['grava'],
          'resistencia': valores['Resistencia'],
          'area':
              double.parse(valores['Ancho']) * double.parse(valores['Largo']),
        };
      case 2:
        return {
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'alto': double.parse(valores['Altura']),
          'gancho': double.parse(valores['gL']),
          'rec': double.parse(valores['ly']),
          'separacion': double.parse(valores['e2']),
          'aceroLong': valores['aceroLong'],
          'aceroAnch': valores['acero-anch'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'resistencia': valores['Resistencia'],
          'tipo': '1',
          'h2': 1.1,
          'h3': 1.1,
          'a1': 1.1,
          'b1': 1.1,
        };
      case 3:
        return {
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'alto': double.parse(valores['Altura']),
          'gancho': double.parse(valores['gL']),
          'rec': double.parse(valores['ly']),
          'separacion': double.parse(valores['e2']),
          'aceroLong': valores['aceroLong'],
          'aceroAnch': valores['acero-anch'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'resistencia': valores['Resistencia'],
          'tipo': '2',
          'h2': double.parse(valores['h2']),
          'h3': double.parse(valores['h3']),
          'a1': double.parse(valores['a1']),
          'b1': double.parse(valores['b1']),
        };
      case 4:
        return {
          'aceroLong': valores['aceroLong'],
          'estribo': valores['estribo'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'rec': double.parse(valores['ly']),
          'resistencia': valores['Resistencia'],
          'altura': double.parse(valores['Altura']),
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'separacion': double.parse(valores['e2']),
          'ganchoEst': double.parse(valores['gE']),
          'ganchoLng': double.parse(valores['gL']),
          'numVar': double.parse(valores['a1']),
        };
      default:
        return {};
    }
  }

  resetValor() {
    valores['Ancho'] = '';
    valores['Altura'] = '';
    valores['Largo'] = '';
    valores['Resistencia'] = '';
    valores['ly'] = '';
    valores['bloque'] = {};
    valores['arena'] = {};
    valores['cemento'] = {};
    valores['acero-long'] = {};
    valores['estribo'] = {};
  }

  bool muroValid() {
    if (valores['bloque']['id'] != null &&
        valores['cemento']['id'] != null &&
        valores['arena']['id'] != null) {
      return true;
    }
    return false;
  }

  bool zapataValid() {
    if (valores['cemento']['id'] != null &&
        valores['arena']['id'] != null &&
        valores['aceroLong']['id'] != null &&
        valores['acero-anch']['id'] != null &&
        valores['Resistencia'] != '') {
      return true;
    }
    return false;
  }

  bool trabeValid() {
    if (valores['cemento']['id'] != null &&
        valores['arena']['id'] != null &&
        valores['grava']['id'] != null &&
        valores['aceroLong']['id'] != null &&
        valores['estribo']['id'] != null &&
        valores['Resistencia'] != '') {
      return true;
    }
    return false;
  }

  bool concretoValid() {
    if (valores['grava']['id'] != null &&
        valores['cemento']['id'] != null &&
        valores['arena']['id'] != null) {
      return true;
    }
    return false;
  }
}
/**'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'alto': double.parse(valores['Altura']),
          'gancho': double.parse(valores['gL']),
          'rec': double.parse(valores['ly']),
          'separacion': double.parse(valores['e2']),
          'aceroLong': valores['aceroLong'],
          'aceroAnch': valores['estibo'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'resistencia': valores['Resistencia'],
          'h2': double.parse(valores['h2']),
          'h3': double.parse(valores['h3']),
          'a1': double.parse(valores['a1']),
          'b1': double.parse(valores['b1']), */