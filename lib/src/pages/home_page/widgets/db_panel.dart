import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/hive_cubit.dart';
import 'package:flutter_app_tas/src/models/dhikr.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/dhikr_Item.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/helpers/helpers.function.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbPanel extends StatelessWidget {
  const DbPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        key: dbPanelKey,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: THelperFunctions.getContainerColor(context),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last Saved Dhikir'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 60,
              height: 2,
              color: TColors.containerColorBlue,
              margin: const EdgeInsets.only(
                top: 3,
                bottom: 15,
              ),
            ),
            const Expanded(
              child: HiveDhikr(),
            ),
          ],
        ),
      ),
    );
  }
}

class HiveDhikr extends StatelessWidget {
  const HiveDhikr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HiveCubit>().openDhikrBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder(
            valueListenable: Hive.box<Dhikr>(keyHiveDhikrsBox).listenable(),
            builder: (context, box, child) {
              final boxLength = box.length;
              if (boxLength == 0) {
                return Center(
                  child: Text('Empty'.tr()),
                );
              }
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  index = boxLength - 1 - index; // интвертация
                  return DhirkItem(
                    box: box,
                    index: index,
                  );
                },
              );
            },
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
