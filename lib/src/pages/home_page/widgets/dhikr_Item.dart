import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/hive_cubit.dart';

import 'package:flutter_app_tas/src/models/dhikr.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/constants/text.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DhirkItem extends StatelessWidget {
  final Box<Dhikr> box;
  final int index;

  const DhirkItem({
    super.key,
    required this.box,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final hiveCibit = context.read<HiveCubit>();
    return GestureDetector(
      onDoubleTap: () => hiveCibit.deleteDhikr(index),
      onTap: () =>
          THelperFunctions.showSnackBar(context, TText.textSnackBarDelete),
      onLongPress: () => hiveCibit.deleteDhikr(index),
      child: Container(
        // height: 48,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: dark
              ? TColors.containerColorDarkLight
              : TColors.tcontainerColorGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Text(
                box.getAt(index)?.counter.toString() ?? '0',
                style: const TextStyle(
                  fontSize: 20,
                  color: TColors.textColorBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 30,
                width: 0.8,
                margin: const EdgeInsets.only(right: 10, left: 5),
                color: TColors.containerColorWhite),
            Expanded(
              child: Text(
                box.getAt(index)?.title ?? 'erroe meassge'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              DateFormat('dd.MM.yyy')
                  .format(box.getAt(index)?.date ?? DateTime.now()),
              style: const TextStyle(
                fontSize: 11,
                color: TColors.textColorGrey,
              ),
            ),
            GestureDetector(
              onTap: () => THelperFunctions.showDialogAlert(
                  contex: context, indexDialog: 1, box: box, index: index),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Image.asset('assets/images/dots.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
