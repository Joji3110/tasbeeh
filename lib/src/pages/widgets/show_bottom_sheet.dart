// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app_tas/src/cubit/theme_cubit.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';

class ShowBottomSheet extends StatelessWidget {
  final int index;
  final Map<String, String>? languageMap;
  final List<Locale>? locales;
  ShowBottomSheet({
    Key? key,
    required this.index,
    this.languageMap,
    this.locales,
  }) : super(key: key);

  final Map<String, ThemeModeOption> myArray = {
    'Светлая': ThemeModeOption.light,
    'Тёмная': ThemeModeOption.dark,
    'Системная': ThemeModeOption.system,
  };

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return index == 0
        ? Container( // Модальное окно для выбора темы
            decoration: BoxDecoration(
                color: !dark ? TColors.lightColor : TColors.containerColorDark,
                borderRadius: BorderRadius.circular(14.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select a theme'.tr(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/icons/close-svgrepo-com.svg',
                          colorFilter: const ColorFilter.mode(
                            TColors.iconColorBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: !dark
                            ? TColors.containerColorWhite
                            : TColors.containerColorDarkLight,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: myArray.entries.map((entry) {
                          final themeCubit = context.read<ThemeCubit>();
                          final currentTheme = themeCubit.state;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return TColors.containerColorWhite
                                        .withOpacity(.32);
                                  }
                                  return TColors.containerColorWhite;
                                }),
                                checkColor: TColors.containerColorBlue,
                                value: entry.value == currentTheme,
                                onChanged: (value) {
                                  if (value == true) {
                                    context
                                        .read<ThemeCubit>()
                                        .setThemeMode(entry.value);
                                  }
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container( // Модальное окно для выбора языка
            decoration: BoxDecoration(
                color: !dark ? TColors.lightColor : TColors.containerColorDark,
                borderRadius: BorderRadius.circular(14.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select a Language'.tr(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/icons/close-svgrepo-com.svg',
                          colorFilter: const ColorFilter.mode(
                            TColors.iconColorBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: !dark
                            ? TColors.containerColorWhite
                            : TColors.containerColorDarkLight,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.asset(
                                  'assets/images/flag-velikobritanii.png',
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.asset(
                                  'assets/images/russia-flag.avif',
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: locales!.map((Locale locale) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          languageMap![locale.languageCode] ??
                                              locale.languageCode),
                                      onTap: () {
                                        EasyLocalization.of(context)
                                            ?.setLocale(locale);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const Divider(),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
