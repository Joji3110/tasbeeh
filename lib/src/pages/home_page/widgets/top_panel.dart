import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/top_panel_cubit.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopPanel extends StatelessWidget {
  TopPanel({Key? key}) : super(key: key);

  final Map<String, int> panelArray = {
    'Activity': 0,
    'Saved': 1,
  };

  @override
  Widget build(BuildContext context) {
    final panelCubit = context.watch<TopPanelCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                key: panelNameKey,
                padding: const EdgeInsets.all(4),
                height: 38,
                decoration: BoxDecoration(
                  color: THelperFunctions.getContainerColor(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: panelArray.entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        panelCubit.changePanelIndex(entry.value);
                      },
                      child: Container(
                        width: 140,
                        decoration: BoxDecoration(
                          color:
                              panelCubit.state.currentPanelIndex == entry.value
                                  ? TColors.containerColorBlue
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          entry.key.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            color: entry.value ==
                                    panelCubit.state.currentPanelIndex
                                ? TColors.textColorWhite
                                : TColors.textColorGrey,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          GestureDetector(
            key: settingPageKey,
            onTap: () => context.go('/settings'),
            child: Container(
              width: 54,
              height: 38,
              decoration: BoxDecoration(
                color: THelperFunctions.getContainerColor(context),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/images/menu.png'),
            ),
          ),
        ],
      ),
    );
  }
}
