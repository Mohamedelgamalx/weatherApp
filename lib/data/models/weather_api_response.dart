import 'package:weather/data/models/city.dart';
import 'package:weather/data/models/list_details.dart';

class WeatherApiResponse {
  late String cod;
  late int message;
  late int cnt;
  late List<ListDetails> list;
  late City city;

  WeatherApiResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  WeatherApiResponse.fromMap(Map<String, dynamic> map) {
    this.cod = map['cod'];
    this.message = map['message'];
    this.cnt = map['cnt'];
    this.list = [];
    (map['list'] as List).forEach((element) {
      this.list.add(ListDetails.fromMap(element));
    });
    this.city = City.fromMap(map['city']);
  }

  Map<String, dynamic> toMap() {

    List<Map> tmpList = [];
    this.list.forEach((element) {
      tmpList.add(element.toMap());
    });

  Map<String, dynamic> map = {
    "cod" : this.cod,
    "message" : this.message,
    "cnt" : this.cnt,
    "list" : tmpList,
    "city" : this.city.toMap(),
  };
  return map;
  }
}