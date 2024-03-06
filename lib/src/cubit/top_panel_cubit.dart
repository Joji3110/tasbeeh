import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/keys.dart';
import 'package:flutter_app_tas/src/utils/tour_target.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TopPanelState {
  int currentPanelIndex = 0;

  TopPanelState(this.currentPanelIndex);
}

class TopPanelCubit extends Cubit<TopPanelState> {
  bool tutorialShown = false;
  late TutorialCoachMark tutorialCoachMark;

  TopPanelCubit() : super(TopPanelState(0));

  void changePanelIndex(int index) {
    emit(TopPanelState(state.currentPanelIndex = index));
  }

  Future<void> setTutorialShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorialShown', true);
    tutorialShown = true;
    emit(state);
  }

  Future<bool> getTutorialShown() async {
    final prefs = await SharedPreferences.getInstance();
    bool? tutorialShown = prefs.getBool('tutorialShown');
    return tutorialShown ?? false;
  }

  void initTutorial(BuildContext context) {
    tutorialCoachMark = TutorialCoachMark(
      targets: addTargetPage(
        panelName: panelNameKey,
        settingPage: settingPageKey,
        counterPanelKey: counterPanelKey,
        incrementButtonKey: incrementButtonKey,
        decrementButtonKey: decrementButtonKey,
        resetButtonKey: resetButtonKey,
        saveButtonKey: saveButtonKey,
      ),
      colorShadow: TColors.buttonColorLightBlue,
      paddingFocus: 10,
      hideSkip: true,
      textSkip: 'прос',
      onFinish: () {
        setTutorialShown();
      },
    );
    // Показываем туториал
    tutorialCoachMark.show(context: context);
  }
}
