import 'package:flutter/material.dart';
import 'package:flutter_app_crypto/net/flutterfire.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              controller: _emailField,
              decoration: InputDecoration(
                hintText: "enter your email",
                hintStyle: TextStyle(color: Colors.white),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: _passwordField,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "enter your password",
                hintStyle: TextStyle(color: Colors.white),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {}
                },
                child: Text("Register"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {}
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
