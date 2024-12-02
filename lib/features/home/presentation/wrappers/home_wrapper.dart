import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/ui/side_bar/side_bar_widget.dart';
import '../../../../app/widgets/separated_wrapper.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return SeparatedWrapper(
      leftSide: const SideBare(),
      rightSide: const RouterOutlet()
    );
  }
}
