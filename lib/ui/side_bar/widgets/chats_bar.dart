import 'package:flutter/material.dart';

class ChatsBar extends StatefulWidget {
  const ChatsBar({Key? key}) : super(key: key);

  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(children: [
          // chats(),
          // search(),
          AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
        ]));
  }

  Widget chats() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: Row(
        children: [
          const Expanded(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 24,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.blue,
                          )),
                      Positioned(
                          left: 12,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.green,
                          )),
                      Positioned(
                          child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                      ))
                    ],
                  ),
                ),
                Text('Chats'),
                Icon(Icons.person),
              ],
            ),
          )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat))
        ],
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.0, color: Colors.black),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 10,
                          minHeight: 10,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.only(bottom: 8.0)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabs() {
    return Container();
  }
}
