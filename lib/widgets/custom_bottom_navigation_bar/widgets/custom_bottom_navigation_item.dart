
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Icon(
          Icons.games, 
          size: 30,
        ),
      ),
      onTap: callback,
    );
  }
}
