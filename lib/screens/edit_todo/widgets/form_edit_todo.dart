
import 'package:flutter/material.dart';
import 'package:productivity_app/database/databases.dart';
import 'package:productivity_app/database/todo_item/todo_item.dart';
import 'package:provider/provider.dart';

class FormEditTodo extends StatefulWidget {
  const FormEditTodo({super.key, required this.todoItem});

  final TodoItem todoItem;

  @override
  State<FormEditTodo> createState() => _FormEditTodoState();
}

class _FormEditTodoState extends State<FormEditTodo> {

  final _formKey = GlobalKey<FormState>();
  String description = "";

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLines: 4,
            initialValue: widget.todoItem.description,
            onChanged: (val){
              setState(() {
                description = val;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "Debes colocar una descripción";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if(_formKey.currentState!.validate()){
                String description_item = description == "" ? widget.todoItem.description : description;
                await context.read<TodoItemDatabase>().updateTodoItem(widget.todoItem.id, description, widget.todoItem.checked);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tarea Actualizada!"), backgroundColor: Colors.green,)
                );
                if (context.mounted) { Navigator.of(context).pop(); }
              }
              
            },
            child: Text("Guardar"),
          ),
        ],
      ),
    );
  }
}
