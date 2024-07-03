
import 'package:flutter/material.dart';
import 'package:productivity_app/database/databases.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/screens/edit_todo/widgets/reordenable_todo_item.dart';

class EditTodoItemsScreen extends StatelessWidget {
  const EditTodoItemsScreen({super.key});

  @override
  Widget build(BuildContext context){

  final todo_items_database = context.watch<TodoItemDatabase>();
  final todo_items = todo_items_database.currentTodoItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Todo"),
      ),
      body: Column(
        children: [
          _Header(),
          ReorderableListView.builder(
            shrinkWrap: true,
            itemCount: todo_items.length,
            itemBuilder: (context, val){
              return ReordenableTodoItem(key: Key("$val"),);
            },
            onReorder: (prev, sig){},
          ),
        ],
      )
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          children: [],
        ),
        Divider(),
      ],
    );
  }
}
