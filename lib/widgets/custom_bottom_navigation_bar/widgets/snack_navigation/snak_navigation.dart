
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/snack_navigation/snack_painter.dart';

class SnackNavigation extends StatelessWidget {
  const SnackNavigation({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 10,
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: SnackPainter(),
      ),
    );
  }
}