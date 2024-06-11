
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/theme/app_theme.dart';
import 'package:productivity_app/widgets/tasks/tasks_progress/circular_draw.dart';

class TasksProgress extends StatelessWidget {
  const TasksProgress({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      width: 150,
      child: Stack(
        children: [
          CircularDraw(),
          _Percent()
        ],
      ),
    );
  }
}

class _Percent extends StatelessWidget {
  const _Percent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) => Align(
        alignment: Alignment.center,
        child: Text(
          "75%",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: theme.primaryColor),
        )
      ),
    );
  }
}

