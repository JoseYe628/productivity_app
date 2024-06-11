
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:productivity_app/theme/app_theme.dart';

import 'package:productivity_app/theme/themes/dracula_theme.dart';


class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit(): super(DraculaLightTheme());
}
