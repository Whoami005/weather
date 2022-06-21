class ErrorMessage {
  String? cod;
  String? message;

  ErrorMessage({this.cod, this.message});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
  }
}
