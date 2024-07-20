
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    Key? key,
    required this.children,
    this.crossAxisAlignment,
  }) : super(key: key);

  final List<Widget> children;
  CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context){

    final themeBloc = BlocProvider.of<ThemeCubit>(context);

    return Dialog(
      backgroundColor: themeBloc.state.backgroundColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
