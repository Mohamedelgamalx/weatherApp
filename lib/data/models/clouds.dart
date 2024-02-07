class Clouds {
  late int all;

  Clouds({
    required this.all
});

  Clouds.fromMap(Map<String, dynamic> map) {

    this.all = map['all'];

  }

  Map<String, dynamic> toMap() {
    return {
      'all' : this.all,
    };
  }
}