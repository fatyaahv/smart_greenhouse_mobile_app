class Plant {
  final String name;
  final double tempMin;
  final double tempMax;
  final double humidityMin;
  final double humidityMax;

  Plant({
    required this.name,
    required this.tempMin,
    required this.tempMax,
    required this.humidityMin,
    required this.humidityMax,
  });

  factory Plant.mock() {
    return Plant(
      name: 'Tomato',
      tempMin: 20,
      tempMax: 28,
      humidityMin: 55,
      humidityMax: 70,
    );
  }
}
