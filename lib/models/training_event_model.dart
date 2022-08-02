import 'package:flutter/material.dart';

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
    // DateTime _dateTimeStart = DateTime.parse(json['datum start']).add(const Duration(hours: 2, minutes: 00));
    DateTime _dateTimeStart = DateTime.parse(json['datum start']).toLocal();
    _dateTimeStart = _dateTimeStart.add(Duration(
        hours: int.parse(json['uur start'].toString().substring(0, 2)),
        minutes: int.parse(json['uur start'].toString().substring(3, 5))));

    DateTime _dateTimeEnd = DateTime.parse(json['datum einde']).toLocal();
    _dateTimeEnd = _dateTimeEnd.add(Duration(
        hours: int.parse(json['uur einde'].toString().substring(0, 2)),
        minutes: int.parse(json['uur einde'].toString().substring(3, 5))));

    return TrainingEvent(
      group: json['Groep'] as String,
      detail: json['Detail'] as String,
      dateTimeStart: _dateTimeStart,
      dateTimeEnd: _dateTimeEnd,
    );
  }
}
