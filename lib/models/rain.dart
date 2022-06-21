class Rain {
  double? d3h;

  Rain({this.d3h});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      d3h: json['3h'],
    );
  }
}
