
import 'package:flutter/material.dart';

class TaskHeader extends StatefulWidget {
  const TaskHeader({super.key});

  @override
  State<TaskHeader> createState() => _TaskHeaderState();
}

class _TaskHeaderState extends State<TaskHeader> {

  bool isActiveEditButton = false;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onLongPress: (){
                    isActiveEditButton = true;
                    setState((){});
                  },
                  child: Text("Tareas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                ),
                isActiveEditButton == true 
                ? TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 100),
                    tween: Tween<double>(begin: 10, end: 20),
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'edit_todo'),
                        child: Icon(Icons.edit, size: value,)
                      );
                    },
                  ) 
                : Container(),
              ],
            ),
          ),
          Divider(height: 10)
        ],
      ),
    );
  }
}
