import 'package:flutter/material.dart';

class TutorialMark extends StatelessWidget {
  final String title, subTitle;
  const TutorialMark({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subTitle,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
