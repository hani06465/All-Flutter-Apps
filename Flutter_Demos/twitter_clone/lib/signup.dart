import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp emailVaild = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(
          /* to center the field in the column we should use */
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 70),
            const Text(
              "Sign up to twitter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a email";
                  } else if (!emailVaild.hasMatch(value)) {
                    return "please enter a valid email";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 10),

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),

              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a password";
                  } else if (value.length < 6) {
                    return "password must be at least 6 characters";
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                    debugPrint("Email: ${_emailController}");
                    debugPrint("password: ${_passwordController}");
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Already have an account? Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
