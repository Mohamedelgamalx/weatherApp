class Coordinates {
  late double lat;
  late double lon;

  Coordinates({
    required this.lat,
    required this.lon,
  });

  Coordinates.fromMap(Map<String, dynamic> map) {
    this.lat = map['lat'];
    this.lon = map['lon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': this.lat,
      'lon': this.lon
    };
  }
}