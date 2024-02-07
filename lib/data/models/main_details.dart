class MainDetails {
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int pressure;
  late int sea_level;
  late int grnd_level;
  late int humidity;
  late double temp_kf;

  MainDetails.fromMap(Map<String, dynamic> map) {
    this.temp = double.parse(map['temp'].round().toString());
    this.feels_like = double.parse(map['feels_like'].round().toString());
    this.temp_min = double.parse(map['temp_min'].round().toString());
    this.temp_max = double.parse(map['temp_min'].round().toString());
    this.pressure = int.parse(map['pressure'].round().toString());
    this.sea_level = int.parse(map['sea_level'].round().toString());
    this.grnd_level = int.parse(map['grnd_level'].round().toString());
    this.humidity = int.parse(map['humidity'].round().toString());
    this.temp_kf = double.parse(map['temp_kf'].round().toString());
  }

  Map<String, dynamic> toMap() {
    return {
    'temp' : this.temp,
    'feels_like' : this.feels_like,
    'temp_min' : this.temp_min,
    'temp_max' : this.temp_max,
    'pressure' : this.pressure,
    'sea_level' : this.sea_level,
    'grnd_level' : this.grnd_level,
    'humidity' : this.humidity,
    'temp_kf' : this.temp_kf,
  };
  }

}