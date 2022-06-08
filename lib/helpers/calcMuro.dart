List<Map<String, dynamic>> calculoMuro(
    double l,
    double a,
    double ly,
    double e,
    double area,
    String ladUnidad,
    double priceLad,
    String cemUnidad,
    double priceCem,
    String arenaUnidad,
    double priceArena) {
  List<Map<String, dynamic>> data = [];
  double ladPrice;
  double desp = 1.03;
  double cemenPrice;
  double arenaPrice;
  double li = ly / 100;
  double totLadr = 1 / (((l / 100) + li) * ((a / 100) + li));
  double mortero = (100 * 100 - (l * a * totLadr)) * (e / 1000000);
  double totCemento = (450 * mortero);
  double totArena = (1.08 * mortero);
  double areaLadri = (totLadr * area) * desp;
  double areaCemento = (totCemento * area) * desp;
  double areaArena = (totArena * area * desp);
  ladUnidad == "mill"
      ? ladPrice = priceLad * areaLadri / 1000
      : ladPrice = areaLadri * priceLad;
  cemUnidad == "ton"
      ? cemenPrice = priceCem * areaCemento / 1000
      : cemenPrice = (areaCemento / 50) * priceCem;
  arenaUnidad == "ton"
      ? arenaPrice = priceArena * areaArena / 1000
      : arenaPrice = areaArena * priceArena;

  data = [
    {
      "titulo": "Total ladrillos:",
      "data": "${(areaLadri).toStringAsFixed(0)}/Un",
      "color": 0xfffffc089
    },
    {
      "titulo": "Total cemento:",
      "data": "${(areaCemento).toStringAsFixed(2)}/kg",
      "color": 0xffe98668
    },
    {
      "titulo": "Total arena:",
      "data": "${(areaArena).toStringAsFixed(2)}/m3",
      "color": 0xffa95b4f
    },
    {
      "titulo": "Precio Tot:",
      "data": "${(ladPrice + cemenPrice + arenaPrice).toStringAsFixed(2)}/mn",
      "color": 0xffa95b4f
    }
  ];
  return data;
}
