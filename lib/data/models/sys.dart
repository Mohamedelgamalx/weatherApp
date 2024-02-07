class Sys {
  late String pod;

  Sys({
    required this.pod
});

  Sys.fromMap(Map<String, dynamic> map) {
    this.pod = map['pod'];

  }

  Map<String, dynamic> toMap() {
    return{
      'pod' : this.pod,
    };
  }
}