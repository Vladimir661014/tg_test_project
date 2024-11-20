import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';

class SeparatedWrapper extends StatelessWidget {
  final Widget leftSide;
  final Widget rightSide;

  SeparatedWrapper(
      {super.key, required this.leftSide, required this.rightSide});

  final double _minSize = 300.0;
  final controller = ResizableController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.7;
    return  ResizableContainer(
        controller: controller,
        direction: Axis.horizontal,
        children: [
          ResizableChild(
              minSize: _minSize, maxSize: screenWidth, child: leftSide),
          ResizableChild(
            child: rightSide,
          ),
        ],
    );
  }
}
