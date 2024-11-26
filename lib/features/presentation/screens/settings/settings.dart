import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/features/presentation/app/router/app_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      child: Text('SettingsScreen'),
    ));
  }
}
