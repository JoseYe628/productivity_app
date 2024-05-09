
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context){
    return Container(
      child: IconButton(
        icon: Icon(Icons.pix, size: 25,), 
        onPressed: callback,
      ),
    );
  }
}
