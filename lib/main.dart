import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/routes/app_routes.dart';
import 'package:productivity_app/theme/themes/dracula_theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeRouteCubit>(create: (context) => HomeRouteCubit()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: const ContentApp()
    );
  }
}

class ContentApp extends StatelessWidget {
  const ContentApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Productivity App",
      theme: DraculaLightTheme().theme(),
      routes: AppRoutes.generateRoutes(),
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
