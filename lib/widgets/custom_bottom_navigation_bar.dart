
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context){
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.task),
          label: 'Tareas',
        ),
        NavigationDestination(
          icon: Icon(Icons.pix),
          label: 'Backlog',
        ),
        NavigationDestination(
          icon: Icon(Icons.punch_clock),
          label: 'Recordatorios',
        ),
      ],
    );
  }
}
