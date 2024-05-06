import 'package:flutter/material.dart';
import 'package:productivity_app/routes/app_routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Productivity App",
      routes: AppRoutes.generateRoutes(),
      initialRoute: AppRoutes.initialRoute,
      home: Container(),
    );
  }
}
