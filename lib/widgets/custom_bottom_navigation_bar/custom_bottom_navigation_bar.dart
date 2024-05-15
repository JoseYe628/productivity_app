
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({super.key, required this.items});

  List<CustomBottomNavigationItem> items;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animationPointA;
  late Animation<double> animationPointB;

  late double currentPointA;
  late double currentPointB;
  late double otroCurrentPointA;
  late double otroCurrentPointB;
  var deviceWidth = WidgetsBinding.instance.platformDispatcher.views.first.display.size.width / WidgetsBinding.instance.platformDispatcher.views.first.display.devicePixelRatio;

  int currentIndex = 0;

  @override
  void initState() {
    int lenItems = widget.items.length;

    print(deviceWidth);
    double itemWidth = 30;
    double remainder = (deviceWidth - (lenItems*itemWidth))/(lenItems + 1);
    setState(() {
      currentPointA = remainder;
      currentPointB = remainder + itemWidth;
    });
    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animationPointA = Tween(begin: currentPointA+20, end: currentPointB+10).animate(controller);
    animationPointB = Tween(begin: currentPointA+20, end: currentPointB+10).animate(controller);
    controller.addListener((){
      setState(() {
        currentPointA = animationPointA.value;
        currentPointB = animationPointB.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void moveSnack(int index){
    if (currentIndex == index) return;
    int lenItems = widget.items.length;
    double itemWidth = 30;
    double remainder = (deviceWidth - (lenItems*itemWidth))/(lenItems + 1);
    double newPointA = ((index + 1)*remainder) + (index*itemWidth);
    double newPointB = ((index + 1)*remainder) + ((index + 1)*itemWidth);
    if(currentIndex < index){
      animationPointA = Tween(begin: currentPointA, end: newPointA).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
      animationPointB = Tween(begin: currentPointB, end: newPointB).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    } else {
      animationPointA = Tween(begin: currentPointA, end: newPointA).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
      animationPointB = Tween(begin: currentPointB, end: newPointB).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    }
    //animationPointA = Tween(begin: currentPointA, end: newPointA).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    //animationPointB = Tween(begin: currentPointB, end: newPointB).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    currentIndex = index;
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context){


    return Container(
      //height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueGrey,
      child: BlocListener<HomeRouteCubit, int>(
        listener: (context, routeIndex) {
          moveSnack(routeIndex);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("a: $currentPointA"),
            Text("b: $currentPointB"),
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
