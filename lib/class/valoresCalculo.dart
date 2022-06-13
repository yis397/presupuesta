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
    'estibo': {},
    'separacion': '',
    'gL': '',
    'gE': '',
    'h2': '',
    'h3': '',
    'a1': '',
    'b1': '',
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
          'alto': double.parse(valores['Altura']),
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
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
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'ly': double.parse(valores['ly']),
          'bloque': valores['bloque'],
          'arena': valores['arena'],
          'cemento': valores['cemento'],
          'grava': valores['grava'],
          'resistencia': valores['resistencia'],
          'area':
              double.parse(valores['Ancho']) * double.parse(valores['Largo']),
        };
      case 2:
        return {
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'alto': double.parse(valores['Alto']),
          'gancho': double.parse(valores['gL']),
          'rec': double.parse(valores['ly']),
          'separacion': double.parse(valores['separacion']),
          'aceroLong': valores['aceroLong'],
          'aceroAnch': valores['estibo'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'resistencia': valores['resistencia'],
          'h2': double.parse(valores['h2']),
          'h3': double.parse(valores['h3']),
          'a1': double.parse(valores['a1']),
          'b1': double.parse(valores['b1']),
        };
      case 3:
        return {
          'aceroLong': valores['aceroLong'],
          'estribo': valores['estibo'],
          'cemento': valores['cemento'],
          'arena': valores['arena'],
          'grava': valores['grava'],
          'rec': double.parse(valores['ly']),
          'resistencia': valores['Resistencia'],
          'altura': double.parse(valores['Altura']),
          'ancho': double.parse(valores['Ancho']),
          'largo': double.parse(valores['Largo']),
          'separacion': double.parse(valores['separacion']),
          'ganchoEst': double.parse(valores['gE']),
          'ganchoLng': double.parse(valores['gL']),
          'numVar': double.parse(valores['a1']),
        };
      default:
        return {};
    }
  }

  resetValor() {
    valores = {
      'Ancho': '',
      'Altura': '',
      'Largo': '',
      'Resistencia': '',
      'ly': '',
      'bloque': {},
      'arena': {},
      'cemento': {},
    };
  }

  bool muroValid() {
    if (valores['bloque']['id'] > 1 &&
        valores['cemento']['id'] > 1 &&
        valores['arena']['id'] > 1) {
      return true;
    }
    return false;
  }

  bool zapataValid() {
    if (valores['bloque']['id'] > 1 &&
        valores['cemento']['id'] > 1 &&
        valores['arena']['id'] > 1 &&
        valores['acero-long'] > 1 &&
        valores['acero-anch'] > 1 &&
        valores['resistencia'] != '') {
      return true;
    }
    return false;
  }

  bool concretoValid() {
    if (valores['grava']['id'] > 1 &&
        valores['cemento']['id'] > 1 &&
        valores['arena']['id'] > 1) {
      return true;
    }
    return false;
  }
}
