import 'package:flutter/material.dart';
import 'package:tg_test_project/features/presentation/widgets/side_bar/widgets/calls_bar.dart';
import 'package:tg_test_project/features/presentation/widgets/side_bar/widgets/contacts_bar.dart';
import 'package:tg_test_project/features/presentation/widgets/side_bar/widgets/settings_bar.dart';
import 'chats_bar.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final int selectedTab;
  AppBars({super.key, required this.selectedTab});

  final List<Widget> _appBars = [
    const ContactsBar(),
    const CallsBar(),
    const ChatsBar(),
    const SettingsBar()
  ];

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            child: _appBars[selectedTab]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(154.0); //
  // Size get preferredSize => Size.fromHeight(134.0); //
}
