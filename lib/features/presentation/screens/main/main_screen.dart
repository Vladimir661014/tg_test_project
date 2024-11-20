import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/features/presentation/widgets/side_bar/side_bar_widget.dart';
import 'package:tg_test_project/features/presentation/widgets/wrappers/separated_wrapper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SeparatedWrapper(
      leftSide: const SideBare(),
      rightSide: const RouterOutlet()
    );
  }
}
