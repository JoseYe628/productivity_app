
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/theme/app_theme.dart';

class CircularDraw extends StatelessWidget {
  const CircularDraw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) => Transform.rotate(
        angle: -pi/2,
        child: Transform.flip(
          flipY: true,
          child: CustomPaint(
            size: const Size(150, 150),
            painter: _CircularProgress(theme.primaryColor),
          ),
        ),
      ),
    );
  }
}

class _CircularProgress extends CustomPainter {

  _CircularProgress(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var brush = Paint()
      ..color = color
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
