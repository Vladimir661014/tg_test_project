import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/features/presentation/app/modules/main_module.dart';
import 'package:tg_test_project/features/presentation/app/router/app_router.dart';

class EntryModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(ar.routeLocation(ar.root), module: MainModule());
  }
}
