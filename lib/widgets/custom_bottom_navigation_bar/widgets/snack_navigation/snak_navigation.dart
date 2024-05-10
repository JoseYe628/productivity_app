
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/snack_navigation/snack_painter.dart';

class SnackNavigation extends StatelessWidget {
  SnackNavigation({super.key, required this.pointA, required this.pointB});

  double pointA;
  double pointB;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 10,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: SnackPainter(pointA: pointA ,pointB: pointB),
      ),
    );
  }
}
