import 'package:JudoRegistration/routes.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final MaterialColor color;
  final double timeline;
  final double width;
  final DateTime start;
  final DateTime end;
  final String title;
  final String comment;
  final double height;
  final double scale;

  const EventTile(
      {Key? key,
      required this.color,
      required this.timeline,
      required this.width,
      required this.height,
      required this.start,
      required this.end,
      required this.title,
      required this.comment,
      required this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int getTimeInMinutes(DateTime dateTime) {
      return dateTime.hour * 60 + dateTime.minute;
    }

    return Positioned(
      left: 0,
      top: ((height / 1440) * getTimeInMinutes(start)) * scale,
      child: GestureDetector(
        onTap: () {
          print('test');
          Navigator.pushNamed(context, Routes.registration);
        },
        child: Container(
          width: (width / 6) * 5,
          height: ((height / 1440) *
                  (getTimeInMinutes(end) - getTimeInMinutes(start))) *
              scale,
          decoration: BoxDecoration(
            color: color[100],
            border: Border(
              left: BorderSide(color: color, width: 7),
            ),
          ),
        ),
      ),
    );
  }
}
