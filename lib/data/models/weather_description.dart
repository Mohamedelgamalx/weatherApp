class WeatherDescription {
  late int id;
  late String? mains;
  late String? description;
  late String icon;

  WeatherDescription({
    required this.id,
    required this.mains,
    required this.description,
    required this.icon,
  });

  WeatherDescription.fromMap(Map<String, dynamic> map) {

    this.id = map['id'];
    this.mains = map['mains'];
    this.description = map['description'];
    this.icon = map['icon'];

  }

  Map<String, dynamic> toMap() {
    return {
      'id' : this.id,
      'mains' : this.mains,
      'description' : this.description,
      'icon' : this.icon,
    };
  }
}