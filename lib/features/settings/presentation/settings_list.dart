import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/app/router/app_router.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({super.key});

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  @override
  void initState() {
    Modular.to.navigate(ar.routeLocation(ar.editProfile));
    super.initState();
  }

  @override
  void dispose() {
    Modular.to.navigate(ar.routeLocation(ar.editProfile, {ar.chatId: 0}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('SettingsList'),
    ));
  }
}
