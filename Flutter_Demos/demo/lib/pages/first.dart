import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
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
