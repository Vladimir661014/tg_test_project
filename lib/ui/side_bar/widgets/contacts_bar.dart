import 'package:flutter/material.dart';

class ContactsBar extends StatefulWidget {
  const ContactsBar({ Key? key }) : super(key: key);

  @override
  _ContactsBarState createState() => _ContactsBarState();
}

class _ContactsBarState extends State<ContactsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ContactsBar'),
    );
  }
}