import 'package:weather/data/models/coordinates.dart';

class City {
  late int id;
  late String name;
  late Coordinates coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City({
  required this.id,
  required this.name,
  required this.coord,
  required this.country,
  required this.population,
  required this.timezone,
  required this.sunrise,
  required this.sunset,
});

  City.fromMap(Map<String, dynamic> map) {
    //print('======city');
    this.id = map['id'];
    //print('6');
    this.name = map['name'];
    //print('7');
    this.coord = Coordinates.fromMap(map['coord']);
    //print('8');
    this.country = map['country'];
    //print('9');
    this.population = map['population'];
    //print('10');
    this.timezone = map['timezone'];
    //print('11');
    this.sunrise = map['sunrise'];
    //print('12');
    this.sunset = map['sunset'];
    //print('13');
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
    "id" : this.id,
    "name" : this.name,
    "coord" : this.coord.toMap(),
    "country" : this.country,
    "population" : this.population,
    "timezone" : this.timezone,
    "sunrise" : this.sunrise,
    "sunset" : this.sunset,
  };
    return map;
  }
}