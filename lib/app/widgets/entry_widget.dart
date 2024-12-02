import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../router/modules/entry_module.dart';
import '../router/app_router.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(ar.routeLocation(ar.chat, {ar.chatId: 0}));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}


class ModularEntryWidget extends StatelessWidget {
  const ModularEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: EntryModule(),
      child: const EntryWidget(),
    );
  }
}
