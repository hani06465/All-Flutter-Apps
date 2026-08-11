import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(
      context,
    )!.settings.arguments; /* accespts the data that comes through route */

    return Scaffold(
      appBar: AppBar(
        title: Text("Dedicated to: $name"),
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
