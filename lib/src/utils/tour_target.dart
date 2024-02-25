import 'package:flutter/material.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> addTargetPage({
  required GlobalKey panelName,
  required GlobalKey settingPage,
  required GlobalKey counterPanelKey,
  required GlobalKey namazcounterPanelKey,
}) {
  List<TargetFocus> target = [];
  target.add(
    TargetFocus(
      keyTarget: panelName,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Панель для переключения: АКТИВНОСТЬ И СОХРАНЕННЫЕ',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 1",
      keyTarget: settingPage,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 1",
      keyTarget: counterPanelKey,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
    ),
  );
  target.add(
    TargetFocus(
      identify: "Target 1",
      keyTarget: namazcounterPanelKey,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
    ),
  );

  // вернуть target
  return target;
}
