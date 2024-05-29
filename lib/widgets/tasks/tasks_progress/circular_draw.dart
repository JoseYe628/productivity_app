
import 'dart:math';

import 'package:flutter/material.dart';

class CircularDraw extends StatelessWidget {
  const CircularDraw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/2,
      child: Transform.flip(
        flipY: true,
        child: CustomPaint(
          size: Size(150, 150),
          painter: _CircularProgress(),
        ),
      ),
    );
  }
}

class _CircularProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var brush = Paint()
      ..color = Colors.pink
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 18
      ..style = PaintingStyle.stroke;
    var mainCircleDiameter = size.width;
    final rect = Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);
    canvas.drawArc(rect, 0.0, (5*pi)/4, false, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
