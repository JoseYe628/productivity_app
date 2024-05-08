
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/snack_navigation/snack_painter.dart';

class SnackNavigation extends StatefulWidget {
  const SnackNavigation({super.key});

  @override
  State<SnackNavigation> createState() => _SnackNavigationState();
}

class _SnackNavigationState extends State<SnackNavigation> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> izquierda;

  double pointB = 110;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    izquierda = Tween(begin: 110.0, end: 290.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0,1, curve: Curves.easeIn)));
    _controller.addListener((){
      //print(_controller.value);
      setState(() {
        pointB = izquierda.value;
      });
      print(izquierda.value);
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Container(
      height: 10,
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: SnackPainter(pointA: pointB - 100 ,pointB: pointB),
      ),
    );
  }
}
