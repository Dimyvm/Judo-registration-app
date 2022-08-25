
class TrainingEvent {
  final String group;
  final String detail;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;

  TrainingEvent(
      {required this.group,
      required this.detail,
      required this.dateTimeStart,
      required this.dateTimeEnd});

  factory TrainingEvent.fromJson(Map<String, dynamic> json) {
    DateTime dateTimeStart = DateTime.parse(json['datum start']).toLocal();
    dateTimeStart = dateTimeStart.add(Duration(
        hours: int.parse(json['uur start'].toString().substring(0, 2)),
        minutes: int.parse(json['uur start'].toString().substring(3, 5))));

    DateTime dateTimeEnd = DateTime.parse(json['datum einde']).toLocal();
    dateTimeEnd = dateTimeEnd.add(Duration(
        hours: int.parse(json['uur einde'].toString().substring(0, 2)),
        minutes: int.parse(json['uur einde'].toString().substring(3, 5))));

    return TrainingEvent(
      group: json['Groep'] as String,
      detail: json['Detail'] as String,
      dateTimeStart: dateTimeStart,
      dateTimeEnd: dateTimeEnd,
    );
  }
  Map<String, dynamic> toJson() => {
      
        'group': group,
        'detail': detail,
        'dateTimeStart': dateTimeStart.toString(),
        'dateTimeEnd': dateTimeEnd.toString(),
  };

}
