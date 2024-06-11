
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';

class CustomBottomNavigationItem extends StatefulWidget {
  const CustomBottomNavigationItem({super.key, required this.callback, required this.icon, required this.index, required this.activeColor, required this.inactiveColor});

  final VoidCallback callback;
  final IconData icon;
  final int index;
  final Color activeColor, inactiveColor;

  @override
  State<CustomBottomNavigationItem> createState() => _CustomBottomNavigationItemState();
}

class _CustomBottomNavigationItemState extends State<CustomBottomNavigationItem> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Color?> animationColor;
  late Animation<double> animationSize;

  late double iconSize;
  late Color? iconColor;

  @override
  void initState() {
    iconSize = widget.index == 0 ? 35.0 : 28.0;
    iconColor = widget.index == 0 ? widget.activeColor : widget.inactiveColor;
    controller = AnimationController(vsync:this, duration: const Duration(milliseconds: 300));
    animationColor = ColorTween(begin: widget.inactiveColor, end: widget.activeColor).animate(controller);
    animationSize = Tween(begin: 28.0, end: 35.0).animate(controller);
    setState(() {});
    controller.addListener((){
      setState((){
        iconColor = animationColor.value;
        iconSize = animationSize.value;
      });
    });
    super.initState();
  }

  void iconToggle(int currentRouteIndex){
    if(widget.index == currentRouteIndex){
      controller.forward();
    } else {
      if(iconColor == widget.activeColor){
        controller.reverse(from: 1.0);
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: widget.callback,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: BlocListener<HomeRouteCubit, int>(
          listener: (context, routeIndex){
            iconToggle(routeIndex);
          },
          child: Icon(
            widget.icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
