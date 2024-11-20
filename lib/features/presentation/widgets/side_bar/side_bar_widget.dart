import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/features/presentation/screens/calls/calls.dart';
import 'package:tg_test_project/features/presentation/screens/chats/chats.dart';
import 'package:tg_test_project/features/presentation/screens/contacts/contacts.dart';
import 'package:tg_test_project/features/presentation/screens/settings/settings.dart';
import 'package:tg_test_project/features/presentation/widgets/providers/models/selected_screen_model.dart';
import 'package:tg_test_project/features/presentation/widgets/providers/selected_screen_provider.dart';

class SideBare extends StatefulWidget {
  const SideBare({super.key});

  @override
  State<SideBare> createState() => _SideBareState();
}

class _SideBareState extends State<SideBare> {
  int selectedScreenIndex = 0;

  final List<Widget> _bodyWidgets = <Widget>[
    const ContactsScreen(),
    const CallsScreen(),
    const ChatsScreen(),
    const SettingsScreen()
  ];

  final List<Map<String, Widget>> _tabs = [
    {
      'icon': const Icon(Icons.person_outlined),
      'selectedIcon': const Icon(Icons.person),
    },
    {
      'icon': const Icon(Icons.call_outlined),
      'selectedIcon': const Icon(Icons.call)
    },
    {
      'icon': const Icon(Icons.messenger_outline),
      'selectedIcon': const Icon(Icons.messenger)
    },
    {
      'icon': const Icon(Icons.settings_outlined),
      'selectedIcon': const Icon(Icons.settings)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SelectedScreenProvider(
        notifier: ScreenIndexNotifier(SelectedScreenModel(selectedIndex: 0)),
        child: Scaffold(
            // appBar: AppBars(selectedTab: selectedScreenIndex),
            body: Builder(builder: (context) {
              return ValueListenableBuilder<SelectedScreenModel>(
                  valueListenable: SelectedScreenProvider.of(context),
                  builder: (context, value, _) {
                    return _bodyWidgets[value.selectedIndex];
                  });
            }),
            bottomNavigationBar: _bottomNavigation()));
  }

  Widget _bottomNavigation() {
    return Builder(builder: (context) {
      return Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          height: 50.0,
          child: ValueListenableBuilder(
              valueListenable: SelectedScreenProvider.of(context),
              builder: (context, value, _) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _tabs
                        .asMap()
                        .entries
                        .map((entry) => IconButton(
                              icon: entry.value['icon'] as Widget,
                              selectedIcon: entry.value['selectedIcon'],
                              isSelected: value.selectedIndex == entry.key,
                              onPressed: () => {
                                SelectedScreenProvider.of(context)
                                    .selectScreenTab(entry.key)
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ))
                        .toList());
              }));
    });
  }
}
