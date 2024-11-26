import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/router/app_router.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('EditProfile'),
        TextButton(
            onPressed: () {
              Modular.to.navigate(ar.routeLocation(ar.editName));
            },
            child: const Text('next'))
      ],
    );
  }
}
