import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.hintText,
    required this.backgroundColorAlert,
  });

  final TextEditingController controller;
  final String? hintText;

  final Color backgroundColorAlert;

  @override
  Widget build(BuildContext context) {
    const colorText = TextStyle(color: TColors.containerColorBlue);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(13.0)),
      borderSide: BorderSide(color: TColors.containerColorBlue, width: 0.5),
    );
    return TextField(
      controller: controller,
      cursorColor: TColors.containerColorBlue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: colorText,
        filled: true,
        fillColor: backgroundColorAlert,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
