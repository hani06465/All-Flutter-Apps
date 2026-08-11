import 'package:demo/pages/first.dart';
import 'package:demo/pages/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      debugShowCheckedModeBanner: false,
      /* we need to register the routes here first to  use them in the named navigation */
      routes: {
        "/": (context) => MyHomePage(),
        "/first": (context) => FirstPage(name: "named navigation"),
        /* the data should go through route */
        "/second": (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
/**/

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network('https://picsum.photos/200/200'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'User name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Notification'),
                Switch(
                  value: isSwitched,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitched = newValue;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // Corner roundness
                  ),
                ),
                child: const Text('Saved'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('saved successfully 👍👍👍')),
                  );
                },
              ),
            ),

            /* first method of Navigation */
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstPage(name: "simple navigation"),
                  ),
                );
              },
              child: const Text("First page"),
            ),
            /*second method of navigation */
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text("Second page"),
            ),

            /* Named Navigation */
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/first");
              },
              child: const Text("First page"),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "/second",
                  arguments: "this data comes from named through routes",
                );
              },
              child: const Text("Second page"),
            ),
          ],
        ),
      ),
    );
  }
}
