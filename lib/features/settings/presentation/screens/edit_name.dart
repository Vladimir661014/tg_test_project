import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../app/router/app_router.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('EditName'),
        Center(
          child: TextButton(
              onPressed: () {
                Modular.to.navigate(ar.routeLocation(ar.editProfile));
              },
              child: const Text('back')),
        ),
      ],
    );
  }
}
