
import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/tasks/tasks_list/widgets/task_item.dart';
import 'package:productivity_app/widgets/tasks/tasks_list/widgets/tasks_header.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          TaskHeader(),
          _TaskList(),
        ],
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: ListView.builder( // No afectará en el rendimiento porque es muy poco probable que se usen demasiados items
        physics: NeverScrollableScrollPhysics(),
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) => TaskItem(
          item: index,
        ),
      ),
    );
  }
}
