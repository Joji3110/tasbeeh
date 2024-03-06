import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_tas/src/cubit/counter_cubit_cubit.dart';
import 'package:flutter_app_tas/src/cubit/hive_cubit.dart';
import 'package:flutter_app_tas/src/cubit/namaz_counter_cubit.dart';
import 'package:flutter_app_tas/src/cubit/theme_cubit.dart';
import 'package:flutter_app_tas/src/cubit/top_panel_cubit.dart';
import 'package:flutter_app_tas/src/hive/dhikrs_adapter.dart';
import 'package:flutter_app_tas/src/pages/home_page/home.dart';
import 'package:flutter_app_tas/src/utils/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/pages/setting_page/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(DhikrAdapter());
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ru')],
    path: 'assets/translations/langs.csv',
    fallbackLocale: const Locale(
      'en',
    ),
    assetLoader: CsvAssetLoader(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => NamazCounterCubit(),
        ),
        BlocProvider(
          create: (context) => TopPanelCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => HiveCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeOption>(
      builder: (context, state) {
        return KeyedSubtree(
          key: ValueKey(context.locale),
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            key: ValueKey<ThemeModeOption>(state),
            themeMode: getThemeMode(state),
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Apha 8',
            routerConfig: _router,
          ),
        );
      },
    );
  }
}

ThemeMode getThemeMode(ThemeModeOption mode) {
  switch (mode) {
    case ThemeModeOption.system:
      return ThemeMode.system;
    case ThemeModeOption.light:
      return ThemeMode.light;
    case ThemeModeOption.dark:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingPage(),
        ),
      ],
    ),
  ],
);
