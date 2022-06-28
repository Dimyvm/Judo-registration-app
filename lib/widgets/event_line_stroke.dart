import 'package:JudoRegistration/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class EventLineStroke extends StatelessWidget {
  final double timeline;
  const EventLineStroke({Key? key, required this.timeline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Container(
      color: Colors.white,
      width: (width / 6) * 5,
      height: height * 3,
      child: Stack(
        fit: StackFit.loose,
        children: [
          //events
          EventTile(
              height: height,
              color: Colors.purple,
              timeline: timeline,
              width: width,
              start: DateTime(2022, 6, 28, 21, 30),
              end: DateTime(2022, 6, 28, 21, 30),
              title: "title",
              comment: "comment"),
          Positioned(
            left: 0,
            top: timeline * 3 - 300,
            child: Container(
              width: (width / 6) * 5,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: const Border(
                  left: BorderSide(color: Colors.green, width: 7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
