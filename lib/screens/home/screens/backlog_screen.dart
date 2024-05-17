
import 'package:flutter/material.dart';

class BacklogScreen extends StatelessWidget {
  const BacklogScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.red,
      child: const Text("BacklogScreen widget"),
    );
  }
}
