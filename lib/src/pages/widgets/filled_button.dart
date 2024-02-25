import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color backgroundColor, foregroundColor;
  final String textButton;

  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(textButton.tr()),
    );
  }
}
