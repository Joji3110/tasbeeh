import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/theme_cubit.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Interface extends StatelessWidget {
  Interface({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = EasyLocalization.of(context)?.supportedLocales ??
        const [
          Locale('en'),
          Locale('ru'),
          Locale('kg'),
        ];
    return Container(
      decoration: BoxDecoration(
          color: THelperFunctions.getContainerColor(context),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 13.0),
              child: Text(
                'Interface'.tr(),
                style: const TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () =>
                  THelperFunctions.showModal(context, 0, languageMap, locales),
              title: Text('Theme design'.tr()),
              trailing: BlocBuilder<ThemeCubit, ThemeModeOption>(
                builder: (context, state) {
                  return Text(
                    _themeModeToString(state).tr(),
                    style: const TextStyle(fontSize: 16.0),
                  );
                },
              ),
            ),
            ListTile(
              onTap: () =>
                  THelperFunctions.showModal(context, 1, languageMap, locales),
              title: Text('Language'.tr()),
              trailing: Text(
                languageMap[context.locale.languageCode] ??
                    context.locale.languageCode,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ]),
    );
  }

  final Map<String, String> languageMap = {
    'en': 'English',
    'ru': 'Русский',
  };

  String _themeModeToString(ThemeModeOption themeMode) {
    switch (themeMode) {
      case ThemeModeOption.light:
        return 'Light';
      case ThemeModeOption.dark:
        return 'Dark';
      case ThemeModeOption.system:
        return 'System';
    }
  }
}
