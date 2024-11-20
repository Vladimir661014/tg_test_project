import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_size/window_size.dart';
import 'features/presentation/app/modules/entry_module.dart';
import '../features/presentation/app/entry_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    const minWidth = 380.0;
    const minHeight = 540.0;
    setWindowMinSize(const Size(minWidth, minHeight));
  }
  runApp(const ModularEntryWidget());
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
