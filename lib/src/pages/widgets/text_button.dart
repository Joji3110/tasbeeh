import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:go_router/go_router.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      style: TextButton.styleFrom(foregroundColor: TColors.buttonColorBlue),
      child: Text(
        'Close'.tr(),
        style: const TextStyle(fontSize: 14.0),
      ),
    );
  }
}
