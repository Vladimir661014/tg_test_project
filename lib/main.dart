import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'app/widgets/entry_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    const minWidth = 380.0;
    const minHeight = 540.0;
    setWindowMinSize(const Size(minWidth, minHeight));
  }
  runApp(const ModularEntryWidget());
}

