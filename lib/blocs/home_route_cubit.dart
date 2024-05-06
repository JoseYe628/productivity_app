

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRouteCubit extends Cubit<int> {
  HomeRouteCubit(): super(0);

  void setIndex(int newIndex) => emit(newIndex);
}
