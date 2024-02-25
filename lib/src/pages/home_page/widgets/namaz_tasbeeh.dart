import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_tas/src/cubit/namaz_counter_cubit.dart';
import 'package:flutter_app_tas/src/pages/widgets/precent_indicator.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NamazTasbeeh extends StatelessWidget {
  const NamazTasbeeh({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamazCounterCubit, NamazCounterState>(
      builder: (context, state) {
        return Column(
         
          children: [
            Container(
              width: 200.0,
              height: 204.0,
              decoration: BoxDecoration(
                color: THelperFunctions.getContainerColor(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const PracentIndicator(),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                context.read<NamazCounterCubit>().incrementNamazTasbeeh();
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.0,
                width: 300,
                decoration: BoxDecoration(
                  color: THelperFunctions.getContainerColor(context),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  state.tasbeehName.tr(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: TColors.textColorBlue,
                    fontWeight: FontWeight.bold,
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
