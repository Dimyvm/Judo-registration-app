
class TrainingEvent{

  final String group;
  final String detail;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;

  TrainingEvent({required this.group, required this.detail, required this.dateTimeStart, required this.dateTimeEnd});

  factory TrainingEvent.fromJson(Map<String, dynamic> json) {
    return TrainingEvent(
      group: json['Groep'] as String,
      detail: json['Detail'] as String,
      dateTimeStart: json['datum start'], 
      dateTimeEnd: json['datum einde'],
    );
  }

}