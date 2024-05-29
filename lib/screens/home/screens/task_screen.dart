import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(height: 35,),
          TasksProgress(),
          SizedBox(height: 20,),
          _DateWidget(),
          // TODO: TasksWidget
        ],
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: const Text(
        "Jue, 20 Sep",
        style: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
