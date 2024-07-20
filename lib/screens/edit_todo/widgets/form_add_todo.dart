
import 'package:flutter/material.dart';

class FormAddTodo extends StatefulWidget {
  const FormAddTodo({super.key});

  @override
  State<FormAddTodo> createState() => _FormAddTodoState();
}

class _FormAddTodoState extends State<FormAddTodo> {
  
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
            onChanged: (val) {
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
            onPressed: (){
              if(_formKey.currentState!.validate()){
                print("Datos correctos");
                print(description);
              }
            },
            child: Text("Guardar"),
          ),
        ],
      ),
    );
  }
}

