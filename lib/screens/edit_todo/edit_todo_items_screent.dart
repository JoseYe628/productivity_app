
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/database/databases.dart';
import 'package:productivity_app/screens/edit_todo/widgets/form_add_todo.dart';
import 'package:productivity_app/widgets/widgets.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Agregar nuevo Todo", style: Theme.of(context).textTheme.bodyLarge,),
                    FormAddTodo(),
                  ],
                )
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: ReorderableListView.builder(
          //shrinkWrap: true,
          //itemCount: todo_items.length,
          itemCount: todo_items.length,
          itemBuilder: (context, val){
            return ReordenableTodoItem(key: Key("$val"), todoItem: todo_items[val],);
          },
          onReorder: (prev, sig){},
        ),
      )
    );
  }
}

