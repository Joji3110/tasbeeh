// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/pages/widgets/filled_button.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:flutter_app_tas/src/cubit/counter_cubit_cubit.dart';
import 'package:flutter_app_tas/src/cubit/hive_cubit.dart';
import 'package:flutter_app_tas/src/models/dhikr.dart';
import 'package:flutter_app_tas/src/pages/widgets/text_button.dart';
import 'package:flutter_app_tas/src/pages/widgets/text_filed.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';

class AlertDialogView extends StatefulWidget {
  final int indexDialog;
  final Box<Dhikr>? box;
  final int? index;
  const AlertDialogView({
    Key? key,
    required this.indexDialog,
    this.box,
    this.index,
  }) : super(key: key);

  

  @override
  State<AlertDialogView> createState() => _AlertDialogViewState();
}


class _AlertDialogViewState extends State<AlertDialogView> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    final hiveCibit = context.read<HiveCubit>();
    final date = DateFormat('dd.MM.yyyy').format(DateTime.now());

    return widget.indexDialog == 0
        ? AlertDialog(
            // Алерт Диалог для сохранения зикра
            backgroundColor: THelperFunctions.getContainerColor(context),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${'Dhikr:'.tr()} ${counterCubit.state.count}',
                    style: const TextStyle(fontSize: 18.0)),
                Text(
                  '${'Date:'.tr()} $date',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                CustomTextFiled(
                  controller: controller,
                  hintText: 'Enter a title'.tr(),
                  backgroundColorAlert:
                      THelperFunctions.getContainerColor(context),
                ),
              ],
            ),
            actions: [
              const CustomTextButton(),
              CustomFilledButton(
                onPressed: () {
                  Hive.box<Dhikr>(keyHiveDhikrsBox).add(
                    Dhikr(
                      counter: counterCubit.state.count,
                      title: controller.text,
                      date: DateTime.now(),
                    ),
                  );
                  context.pop();
                },
                backgroundColor: TColors.buttonColorBlue,
                foregroundColor: TColors.textColorWhite,
                textButton: 'Add',
              ),
            ],
          )
        : AlertDialog(
            // Алерт Диалог для изменения зикра
            backgroundColor: THelperFunctions.getContainerColor(context),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Edit Dhikr'.tr(), style: const TextStyle(fontSize: 17.0)),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFiled(
                  controller: controller,
                  hintText: widget.box!.getAt(widget.index!)?.title,
                  backgroundColorAlert:
                      THelperFunctions.getContainerColor(context),
                )
              ],
            ),
            actions: [
              const CustomTextButton(),
              CustomFilledButton(
                backgroundColor: TColors.buttonColorBlue,
                foregroundColor: TColors.textColorWhite,
                textButton: 'Save',
                onPressed: () {
                  hiveCibit.editDhikr(widget.index, controller.text);
                  context.pop();
                },
              ),
            ],
          );
  }
}
