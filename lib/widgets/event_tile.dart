
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

  const EventTile(
      {Key? key,
      required this.color,
      required this.timeline,
      required this.width,
      required this.height,
      required this.start,
      required this.end,
      required this.title,
      required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: ((height/1440) * (start.hour * 60) + start.minute) *3 -50,
      child: Container(
        width: (width / 6) * 5,
        height: 100,
        decoration: BoxDecoration(
          color: color[100],
          border: Border(
            left: BorderSide(color: color, width: 7),
          ),
        ),
      ),
    );
  }
}
