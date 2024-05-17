import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
          Container(width: 50, height: 50, color: Colors.yellowAccent, margin: EdgeInsets.all(2),),
        ],
      ),
    );
  }
}
