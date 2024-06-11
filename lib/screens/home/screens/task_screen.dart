import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/theme/app_theme.dart';
import 'package:productivity_app/widgets/widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context){


    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
            TasksProgress(),
            SizedBox(height: 20,),
            _DateWidget(),
            SizedBox(height: 20,),
            TasksList(),
          ],
        ),
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget({super.key});

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) => Container(
        child: Text(
          "Jue, 20 Sep",
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
