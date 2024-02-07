class Wind {
  late double speed;
  late int deg;
  late double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
});

  Wind.fromMap(Map<String, dynamic> map) {
    this.speed = double.parse(map['speed'].toString());
    this.deg = int.parse(map['deg'].round().toString());
    this.gust = double.parse(map['gust'].round().toString());
  }

  Map<String, dynamic> toMap() {
    return {
    'speed' : this.speed,
    'deg' : this.deg,
    'gust' : this.gust,
    };
  }
}