
import 'package:flutter/material.dart';

class SnackPainter extends CustomPainter {

  double pointA, pointB;

  SnackPainter({required this.pointA, required this.pointB});

  @override
  void paint(Canvas canvas, Size size) {
    var brush = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
      canvas.drawLine(Offset(pointA, size.height/2), Offset(pointB, size.height/2), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
