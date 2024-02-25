import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/models/dhikr.dart';

import 'package:flutter_app_tas/src/pages/setting_page/wiggets/alert.dart';
import 'package:flutter_app_tas/src/pages/widgets/show_bottom_sheet.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:hive_flutter/hive_flutter.dart';

class THelperFunctions {
  static Color getContainerColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? TColors.containerColorDark : TColors.containerColorWhite;
  }

  static Future<dynamic> showModal(
    BuildContext context,
    int index,
    final Map<String, String>? languageMap,
    final List<Locale>? locales,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowBottomSheet(
          index: index,
          languageMap: languageMap,
          locales: locales,
        );
      },
    );
  }

  static void showDialogAlert({
    required BuildContext contex,
    required int indexDialog,
    int? index,
    Box<Dhikr>? box,
  }) {
    showDialog(
        context: contex,
        builder: (contex) {
          return AlertDialogView(
            indexDialog: indexDialog,
            index: index,
            box: box,
          );
        });
  }
}
