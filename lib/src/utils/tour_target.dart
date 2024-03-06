import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/pages/widgets/custom_tutotial.dart';
import 'package:flutter_app_tas/src/utils/constants/text.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> addTargetPage({
  required GlobalKey panelName,
  required GlobalKey settingPage,
  required GlobalKey counterPanelKey,
  required GlobalKey incrementButtonKey,
  required GlobalKey decrementButtonKey,
  required GlobalKey resetButtonKey,
  required GlobalKey saveButtonKey,
}) {
  List<TargetFocus> target = [];
  target.add(
    TargetFocus(
      identify: 'Target 0',
      keyTarget: panelName,
      alignSkip: Alignment.topLeft,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleTopPanel.tr(),
            subTitle: TText.subTitleTopPanel.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 1",
      keyTarget: settingPage,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleSettingPage.tr(),
            subTitle: TText.subTitleSettingPage.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 2",
      keyTarget: counterPanelKey,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleCounterPanel.tr(),
            subTitle: TText.subTitleCounterPAnel.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 3",
      keyTarget: incrementButtonKey,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleIncrementButton.tr(),
            subTitle: TText.subTitleIncremenButton.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 4",
      keyTarget: decrementButtonKey,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleDecrementButton.tr(),
            subTitle: TText.susubTitleDecrementButton.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 5",
      keyTarget: resetButtonKey,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleResetButton.tr(),
            subTitle: TText.subTitleResetButton.tr(),
          ),
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 6",
      keyTarget: saveButtonKey,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: TutorialMark(
            title: TText.titleSaveButton.tr(),
            subTitle: TText.subTitleSaveButton.tr(),
          ),
        ),
      ],
    ),
  );

  // вернуть target
  return target;
}
