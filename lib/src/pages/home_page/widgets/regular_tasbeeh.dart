import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/counter_cubit_cubit.dart';
import 'package:flutter_app_tas/src/pages/widgets/container_buttton.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasbeah extends StatelessWidget {
  const Tasbeah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        final counterCubit = context.read<CounterCubit>();
        return Column(
          key: counterPanelKey,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: THelperFunctions.getContainerColor(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => counterCubit.updateCounterByIndex(1),
                    child: const ContainerGestureWidget(
                      image: 'assets/images/decrement.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => counterCubit.updateCounterByIndex(0),
                    child: Container(
                      width: 154,
                      height: 154,
                      decoration: BoxDecoration(
                        color: TColors.buttonColorBlue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: TColors.containerColorBlue.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                              0,
                              4,
                            ), // изменит смещение, если необходимо
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            state.count.toString(),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: TColors.textColorWhite,
                              height: 1,
                            ),
                          ),
                          Text(
                            'Dhikir'.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: TColors.textColorWhite,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 1),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => counterCubit.updateCounterByIndex(2),
                    child: const ContainerGestureWidget(
                      image: 'assets/images/vector.png',
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => THelperFunctions.showDialogAlert(
                  contex: context, indexDialog: 0),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                      color: THelperFunctions.getContainerColor(context),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Saved Dhikir'.tr(),
                    style: const TextStyle(
                      color: TColors.textColorBlue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
