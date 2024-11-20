import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'router/app_router.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
        '${ar.buildRoute('home')()}${ar.buildRoute('chat')()}/0');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
