

import 'package:flutter/material.dart';
  
class CustomLinePainter extends CustomPainter {
  
  final Color color;
  /// the [width] must between 0 and 1.
  /// 
  /// 0.5 = 50 % of the total with.
  final double width;

  ///The drawing line start always on 5% left of the total width.
  ///
  ///the line will always be drawn horizontally in the center.
  CustomLinePainter({this.color = Colors.black, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    paint.color = color;

    canvas.drawLine(
      Offset(size.width * 0.5/10, size.height * 1/ 2), 
      Offset(size.width * width, size.height * 1/ 2), 
      paint);
  }

  @override
  bool shouldRepaint(CustomLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomLinePainter oldDelegate) => false;

}