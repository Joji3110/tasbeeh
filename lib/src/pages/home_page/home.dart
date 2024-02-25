import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/cubit/top_panel_cubit.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/counter_panel.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/db_panel.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/top_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final panelCubit = context.watch<TopPanelCubit>();

    // Покажем туториал при инициализации виджета, если он еще не был показан
    context.read<TopPanelCubit>().getTutorialShown().then((shown) {
      if (!shown) {
        context.read<TopPanelCubit>().initTutorial(context);
      }
    });
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            children: [
              TopPanel(),
              panelCubit.state.currentPanelIndex ==
                      0 // Если panelCubit.state.currentPanelIndex == 0
                  ? const CounterPanel() // показываем CounterPanel, иначе возвращаем виджет
                  : Container(),
              const DbPanel()
            ],
          ),
        ),
      ),
    );
  }
}
