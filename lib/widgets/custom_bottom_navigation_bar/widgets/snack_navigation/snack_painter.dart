
import 'package:flutter/material.dart';

class SnackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var brush = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
      canvas.drawLine(Offset(size.width/3, size.height/2), Offset(size.width/2, size.height/2), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
