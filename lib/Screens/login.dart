import 'package:flutter/material.dart';
import 'package:taskbuilder/Screens/createaccount.dart';
import 'package:taskbuilder/Screens/signin.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  "Welcome to Task Builder",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25, // Optional: Set the font size as needed
                  ),
                  textAlign:
                      TextAlign.center, // Optional: Center align the text
                ),
              ),
              Center(
                  child: Text(
                "Please login to your account or create new account to continue..",
                style: TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )),
              SizedBox(height: 70),
              Image(image: AssetImage("assets/images/1.webp")),
              SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SingnIn()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
