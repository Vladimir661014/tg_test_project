import 'package:flutter/material.dart';

class SettingsBar extends StatefulWidget {
  const SettingsBar({ Key? key }) : super(key: key);

  @override
  _SettingsBarState createState() => _SettingsBarState();
}

class _SettingsBarState extends State<SettingsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Text('SettingsBar'),
    );
  }
}