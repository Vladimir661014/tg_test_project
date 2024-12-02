import 'package:flutter/material.dart';
import 'package:tg_test_project/common/providers/selected_screen_provider/models/selected_screen_model.dart';
import 'package:tg_test_project/common/providers/selected_screen_provider/selected_screen_provider.dart';
import 'package:tg_test_project/features/calls/presentation/screens/calls_list.dart';
import 'package:tg_test_project/features/chats/presentation/screens/chats_list.dart';
import 'package:tg_test_project/features/contacts/presentation/screens/contacts_list.dart';
import 'package:tg_test_project/features/settings/presentation/settings_list.dart';


class SideBare extends StatefulWidget {
  const SideBare({super.key});

  @override
  State<SideBare> createState() => _SideBareState();
}

class _SideBareState extends State<SideBare> {
  int selectedScreenIndex = 0;

  final List<Widget> _bodyWidgets = <Widget>[
    const ContactsList(),
    const CallsList(),
    const ChatsList(),
    const SettingsList()
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
