import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/namaz_counter_cubit.dart';
import 'package:flutter_app_tas/src/pages/setting_page/wiggets/precent_indicator.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracentIndicator extends StatelessWidget {
  const PracentIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamazCounterCubit, NamazCounterState>(
        builder: (context, state) {
      final double precentToDouble = state.namazCounter / 100;
      return Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: MyPainter(precent: precentToDouble),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${state.namazCounter}",
                  style: const TextStyle(
                      color: TColors.textColorBlue,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 80.0,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: TColors.containerColorBlue,
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
