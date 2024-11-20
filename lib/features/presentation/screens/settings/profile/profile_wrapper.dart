import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RouterOutlet());
  }
}
