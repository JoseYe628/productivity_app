
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/database/todo_item/todo_item.dart';
import 'package:productivity_app/database/todo_item/todo_item_database.dart';
import 'package:productivity_app/screens/edit_todo/widgets/form_edit_todo.dart';
import 'package:productivity_app/theme/app_theme.dart';
import 'package:productivity_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ReordenableTodoItem extends StatelessWidget {
  const ReordenableTodoItem({super.key, required this.todoItem});

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
        decoration: BoxDecoration(
          color: theme.accentColor,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "${todoItem.description}: ${todoItem.id}, order: ${todoItem.order}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await context.read<TodoItemDatabase>().deleteTodoItem(todoItem.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Tarea eliminada"), backgroundColor: Colors.red,)
                    );
                  },
                  child: Icon(Icons.delete),
                ),
                SizedBox(height: 8),
                _EditButton(todoItem: todoItem,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    super.key,
    required this.todoItem,
  });

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Editar tarea", style: Theme.of(context).textTheme.bodyLarge,),
              FormEditTodo(todoItem: todoItem,)
            ],
          )
        );
      },
      child: Icon(Icons.edit)
    );
  }
}
