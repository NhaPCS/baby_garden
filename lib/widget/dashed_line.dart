import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class DashedLine extends CustomPainter {
  final Color color;
  final double width;
  final double dashWidth;
  final double dashSpace;

  DashedLine(
      {this.color = ColorUtil.lineColor,
      this.width = 1000,
      this.dashWidth = 1,
      this.dashSpace = 3});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = dashWidth;
    var max = this.width;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashWidth, 0), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(DashedLine oldDelegate) {
    return false;
  }
}
