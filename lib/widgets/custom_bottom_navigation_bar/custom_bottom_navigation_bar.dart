
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> izquierda;
  double val = 110;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    izquierda = Tween(begin: 110.0, end: 290.0).animate(CurvedAnimation(parent: controller, curve: Interval(0,1, curve: Curves.easeIn)));
    controller.addListener((){
      setState(() {
        val = izquierda.value;
      });
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      //height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationItem(),
              CustomBottomNavigationItem(),
              CustomBottomNavigationItem(),
            ],
          ),
          SnackNavigation(point: val,)
        ],
      ),
    );
  }
}
