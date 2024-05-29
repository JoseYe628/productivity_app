
import 'package:flutter/material.dart';

abstract class AppTheme {
  Color backgroundColor; // Color de fondo de la app
  Color primaryColor; // Color principal, usado en la mayoría de componentes
  Color seccondaryColor; // Color que complementa al principal
  Color accentColor; // Color para resaltar algo en la vista
  Color textColor; // Color de texto
  Color errorColor;
  Color succesColor;

  AppTheme({
    required this.backgroundColor,
    required this.primaryColor,
    required this.seccondaryColor,
    required this.accentColor,
    required this.textColor,
    required this.errorColor,
    required this.succesColor,
  });

  ThemeData theme() => ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
  );



}
