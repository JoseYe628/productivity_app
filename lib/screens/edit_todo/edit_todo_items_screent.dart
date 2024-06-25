
import 'package:flutter/material.dart';
import 'package:productivity_app/screens/edit_todo/widgets/reordenable_todo_item.dart';

class EditTodoItemsScreen extends StatelessWidget {
  const EditTodoItemsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Todo"),
      ),
      body: Container(
        child: ReorderableListView.builder(
          itemCount: 5,
          itemBuilder: (context, val){
            return ReordenableTodoItem(key: Key("$val"),);
          },
          onReorder: (prev, sig){},
        ),
      )
    );
  }
}
