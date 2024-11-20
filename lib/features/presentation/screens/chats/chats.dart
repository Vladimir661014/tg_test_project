import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app/router/app_router.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              var chatId = ++index;
              return ListTile(
                title: Text('Item $chatId'),
                onTap: (){
                  Modular.to.navigate(ar.buildRoute('home')('chat')('$chatId')());
                },
              );
            }));
  }
}
