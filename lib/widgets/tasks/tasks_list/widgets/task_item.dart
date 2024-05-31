
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem ({super.key, required this.item});

  final int item;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text("Item de tarea", style: TextStyle(fontWeight: FontWeight.w100),)
    );
  }
}
