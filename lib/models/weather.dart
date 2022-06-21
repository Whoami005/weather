class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
