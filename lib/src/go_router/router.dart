import 'package:flutter_app_tas/src/pages/home_page/home.dart';
import 'package:flutter_app_tas/src/pages/setting_page/setting_page.dart';
import 'package:go_router/go_router.dart';

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
