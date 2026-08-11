import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Twitter Demo', home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp emailVaild = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Twitter Clone')],
        ),
        backgroundColor: Colors.blue,
      ),

      body: Form(
        key: _signInKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Enter your email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter a email";
                } else if (!emailVaild.hasMatch(value)) {
                  return "please enter a valid email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter a password";
                } else if (value.length < 6) {
                  return "password must be at least 6 characters";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_signInKey.currentState!.validate()) {
                  debugPrint("Email: ${_emailController}");
                  debugPrint("password: ${_passwordController}");
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
