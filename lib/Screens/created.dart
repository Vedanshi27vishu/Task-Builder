import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskbuilder/Screens/signin.dart';

class Created extends StatelessWidget {
  const Created({super.key});

  get automaticallyImplyLeading => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Lottie.asset("assets/images/Animation - 1716672502062.json"),
          Text(
            "Your account successfully created!",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Welcome to Your Ultimate Shopping Destination Your Account is Created, Unleash the Joy of Seamless Online Shopping! ",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SingnIn()),
                    );
                  },
                  child: const Text("Continue",style: TextStyle(fontWeight: FontWeight.bold),))),
        ],
      ),
    )));
  }
}