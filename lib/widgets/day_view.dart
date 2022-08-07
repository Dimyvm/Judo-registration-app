import 'package:flutter/material.dart';
import 'time_line_stroke.dart';

class DayView extends StatelessWidget {
  ///[day] Show the previous, current or next [day].
  ///0= current [day] 
  ///-1 = previous [day] 
  ///1 = next [day] 
  final int day;
  final double heightMinAppbar;
  final double width;
  final double scale;
  /// Passing the [timeline].
  final double timeline;
  /// Add a list of EventTiles.
  final List<Widget> events;

  ///Dayview is overview of one day and is moving in function of time 
  ///
  ///Left side - a TimelineStroke 
  ///
  ///Right side - overview of all events in that day.
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

    ///Moving the DayView in function of time
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
            width: (width / 6) * 5,  //width of 5/6
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
