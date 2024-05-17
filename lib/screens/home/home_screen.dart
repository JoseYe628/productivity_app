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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("ProductivityApp"),
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
    );
  }
}
