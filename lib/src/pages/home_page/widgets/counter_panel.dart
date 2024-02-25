import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/namaz_tasbeeh.dart';
import 'package:flutter_app_tas/src/pages/home_page/widgets/regular_tasbeeh.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          Tasbeah(), // обычный тасбих
          NamazTasbeeh(), // тасбих для намаза
        ],
      ),
    );
  }
}
