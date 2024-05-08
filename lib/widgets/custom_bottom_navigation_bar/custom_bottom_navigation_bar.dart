
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      //height: 60,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationItem(),
              CustomBottomNavigationItem(),
              CustomBottomNavigationItem(),
            ],
          ),
          SnackNavigation()
        ],
      ),
    );
  }
}
