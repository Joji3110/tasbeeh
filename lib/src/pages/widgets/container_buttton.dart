import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';

class ContainerGestureWidget extends StatelessWidget {
  final String image;

  const ContainerGestureWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: TColors.buttonColorLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(image),
    );
  }
}
