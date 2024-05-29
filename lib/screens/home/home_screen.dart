import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/screens/home/screens/screens.dart';
import 'package:productivity_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("RunApp"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeRouteCubit, int>(
        builder: (BuildContext context, index){
          Widget screen;
          switch (index) {
            case 0:
              screen = TaskScreen();
            case 1:
              screen = BacklogScreen();
            case 2:
              screen = ScheduleScreen();
            default:
              screen = TaskScreen();
          }
          return AnimatedSwitcher(
            child: screen,
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) => FadeTransition(child: child, opacity: animation,),
          );
        },
      ),
      bottomNavigationBar: const _BottomNav(),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final homeRouteCubit = BlocProvider.of<HomeRouteCubit>(context);

    return CustomBottomNavigationBar(
      items: [
        CustomBottomNavigationItem(
          icon: Icons.task,
          index: 0,
          callback: (){
            homeRouteCubit.setIndex(0);
          },
        ),
        CustomBottomNavigationItem(
          icon: Icons.list,
          index: 1,
          callback: (){
            homeRouteCubit.setIndex(1);
          },
        ),
        CustomBottomNavigationItem(
          icon: Icons.schedule,
          index: 2,
          callback: (){
            homeRouteCubit.setIndex(2);
          },
        ),
      ],
    );
  }
}
