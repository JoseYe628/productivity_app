
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Icon(Icons.games),
      onTap: callback,
    );
  }
}
