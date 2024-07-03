
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/theme/app_theme.dart';

class ReordenableTodoItem extends StatelessWidget {
  const ReordenableTodoItem({super.key});

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
                "Este es el contenidoEste es el contenidoEste es el contenidoEste",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ),
            Column(
              children: [
                Icon(Icons.delete),
                SizedBox(height: 8),
                Icon(Icons.edit),
              ],
            )
          ],
        ),
      ),
    );
  }
}
