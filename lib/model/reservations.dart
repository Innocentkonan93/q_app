class Reservations {
  int id;
  String agenceService;
  DateTime dateRdv;

  Reservations({this.id, this.agenceService, this.dateRdv});

  factory Reservations.formJson(Map<String, dynamic> json) {
    return Reservations(
      id: json['id'] as int,
      agenceService: json['agenceService'] as String,
      dateRdv: json['dateRdv'] as DateTime,
    );
  }
}
