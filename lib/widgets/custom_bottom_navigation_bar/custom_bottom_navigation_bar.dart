
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({super.key, required this.items, required this.initialWidthDevice});

  List<CustomBottomNavigationItem> items;
  double initialWidthDevice;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animationPointA;
  late Animation<double> animationPointB;

  late double currentPointA;
  late double currentPointB;

  @override
  void initState() {
    int lenItems = widget.items.length;
    double deviceWidth = widget.initialWidthDevice;
    double itemWidth = 25;
    double remainder = (deviceWidth - (lenItems*itemWidth))/(lenItems + 1);
    setState(() {
      currentPointA = remainder;
      currentPointB = remainder + itemWidth;
    });
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void moveSnack(int index){

  }

  @override
  Widget build(BuildContext context){

    return Container(
      //height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueAccent,
      child: BlocListener<HomeRouteCubit, int>(
        listener: (context, routeIndex) {
          print(routeIndex);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items,
            ),
            SnackNavigation(pointA: currentPointA, pointB: currentPointB,)
          ],
        ),
      ),
    );
  }
}
