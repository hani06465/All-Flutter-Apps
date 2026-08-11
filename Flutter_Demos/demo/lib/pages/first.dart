import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String? name;
  const FirstPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEDICATED TO: $name"),
        backgroundColor: Colors.blue,
      ),
      /* in this when we navigate to another page we will got a button by default that takes us back  and if we want we can do it by ourselves using pop() */
      body: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('pop'),
      ),
    );
  }
}
