class Sys {
  String? country;

  Sys({this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'],
    );
  }
}
