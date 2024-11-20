import 'package:flutter/material.dart';

class ChatStory extends StatelessWidget {
  final String id;

  const ChatStory({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: id != '0' ? Text('Hello $id') : const Text('No chats')
      ),
    );
  }
}
