import 'package:flutter/material.dart';

import 'time_line_stroke.dart';

class DayView extends StatelessWidget {
  final int day;
  final double heightMinAppbar;
  final double width;
  final double scale;
  final double timeline;
  final List<Widget> events;
  const DayView(
      {Key? key,
      this.day = 0,
      required this.heightMinAppbar,
      required this.width,
      required this.scale,
      required this.timeline,
      this.events = const []})
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    double? getPosition(){
     if(day == 0 ){
        return -(timeline * scale - (heightMinAppbar / 2)); // moving background
      }
      else if(day == 1 ){
        return -(timeline * scale - (heightMinAppbar / 2)) + heightMinAppbar * scale;// moving background
      }else if(day == -1 ){
        return -(timeline * scale  - (heightMinAppbar / 2)) - heightMinAppbar * scale; // moving background
      }
      return null;
  }

    return Positioned(

      top: getPosition(),

      child: Row(
        children: [
          //Timelinestroke
          TimeLineStroke(heightMinAppbar: heightMinAppbar),
          //events overview
          Container(
            color: day == 0 ? Colors.white : Colors.grey[100],
            width: (width / 6) * 5,
            height: heightMinAppbar * scale,
            child: Stack(
              fit: StackFit.loose,
              children: events,
            ),
          ),
        ],
      ),
    );
  }
}
