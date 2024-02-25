import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/pages/setting_page/wiggets/interface.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/'),
                      child: SvgPicture.asset(
                        'assets/icons/left-arrow-svgrepo-com.svg',
                        colorFilter: const ColorFilter.mode(
                          TColors.iconColorBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Settings'.tr(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Interface(),
            ],
          ),
        ),
      ),
    );
  }
}
