import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsWrapper extends StatelessWidget {
  const SettingsWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  RouterOutlet()
    );
  }
}