
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity_app/blocs/blocs.dart';
import 'package:productivity_app/widgets/custom_bottom_navigation_bar/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({super.key, required this.items});

  List<CustomBottomNavigationItem> items;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void moveSnack(int index){

  }

  @override
  Widget build(BuildContext context){

    return Container(
      //height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueAccent,
      child: BlocListener<HomeRouteCubit, int>(
        listener: (context, routeIndex) {
          print(routeIndex);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items,
            ),
            SnackNavigation(point: 140)
          ],
        ),
      ),
    );
  }
}
