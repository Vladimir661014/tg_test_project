import 'package:flutter/material.dart';
import 'models/selected_screen_model.dart';

class ScreenNavigationChecker {
  
void selectScreenTab(int index) {
    
  }
}

class ScreenIndexNotifier extends ValueNotifier<SelectedScreenModel> {
  ScreenIndexNotifier(super.state);

  void selectScreenTab(int index) {
    value = value.copyWith(selectedIndex: index);
  }
}

class SelectedScreenProvider extends InheritedWidget {
  const SelectedScreenProvider({
    super.key,
    required super.child,
    required this.notifier,
  });

  final ScreenIndexNotifier notifier;

  static ScreenIndexNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SelectedScreenProvider>()!
        .notifier;
  }

  @override
  bool updateShouldNotify(SelectedScreenProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
