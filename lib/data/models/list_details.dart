import 'package:weather/data/models/clouds.dart';
import 'package:weather/data/models/main_details.dart';
import 'package:weather/data/models/sys.dart';
import 'package:weather/data/models/weather_description.dart';
import 'package:weather/data/models/wind.dart';

class ListDetails {
  late int dt;
  late MainDetails main;
  late List<WeatherDescription> weather;
  late Clouds clouds;
  late Wind wind;
  late int visibility;
  late double pop;
  late Sys sys;
  late String dt_txt;

  ListDetails({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dt_txt,
});

  ListDetails.fromMap(Map<String, dynamic> map) {
    this.dt = map['dt'];
    this.main = MainDetails.fromMap(map['main']);
    this.weather = [];
    (map['weather'] as List).forEach((element) {
      this.weather.add(WeatherDescription.fromMap(element));
    });
    this.clouds = Clouds.fromMap(map['clouds']);
    this.wind = Wind.fromMap(map['wind']);
    this.visibility = map['visibility'];
    this.pop = double.parse(map['pop'].round().toString());
    this.sys = Sys.fromMap(map['sys']);
    this.dt_txt = map['dt_txt'];
  }

  Map<String, dynamic> toMap() {
    List<Map> tmpList = [];
    this.weather.forEach((element) {
      tmpList.add(element.toMap());
    });
    Map<String, dynamic> map = {
    'dt' : this.dt,
    'main' : this.main.toMap(),
    'clouds' : this.clouds.toMap(),
    'wind' : this.wind.toMap(),
    'visibility' : this.visibility,
    'pop' : this.pop,
    'sys' : this.sys.toMap(),
    'dt_txt' : this.dt_txt,
    };
    return map;
  }
}