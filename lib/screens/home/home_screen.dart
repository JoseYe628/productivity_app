import 'package:flutter/material.dart';
import 'package:productivity_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductivityApp"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("HomeScreen"),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
