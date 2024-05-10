import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){

    final homeRouteCubit = BlocProvider.of<HomeRouteCubit>(context);
    final widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductivityApp"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("HomeScreen"),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        initialWidthDevice: widthDevice,
        items: [
          CustomBottomNavigationItem(
            callback: (){
              homeRouteCubit.setIndex(0);
            },
          ),
          CustomBottomNavigationItem(
            callback: (){
              homeRouteCubit.setIndex(1);
            },
          ),
          CustomBottomNavigationItem(
            callback: (){
              homeRouteCubit.setIndex(2);
            },
          ),
        ],
      ),
    );
  }
}
