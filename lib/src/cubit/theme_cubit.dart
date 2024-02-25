import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeOption {
  system,
  light,
  dark,
}

class ThemeCubit extends Cubit<ThemeModeOption> {
  ThemeCubit() : super(ThemeModeOption.system) {
    loadTheme();
  }

  void setThemeMode(ThemeModeOption mode) {
    emit(mode);
    saveTheme(mode);
  }

  void saveTheme(ThemeModeOption mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme_mode', mode.toString());
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme_mode');
    if (savedTheme != null) {
      emit(parseTheme(savedTheme));
    }
  }

  ThemeModeOption parseTheme(String themeString) {
    switch (themeString) {
      case 'ThemeModeOption.system':
        return ThemeModeOption.system;
      case 'ThemeModeOption.light':
        return ThemeModeOption.light;
      case 'ThemeModeOption.dark':
        return ThemeModeOption.dark;
      default:
        return ThemeModeOption.system;
    }
  }
}
