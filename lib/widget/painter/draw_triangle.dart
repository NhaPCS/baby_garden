import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  Paint _paint;
  final Color color;
  final List<Offset> offsets;

  DrawTriangle({@required this.offsets, this.color = Colors.white}) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    for (Offset offset in offsets) {
      path.lineTo(offset.dx, offset.dy);
    }
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
