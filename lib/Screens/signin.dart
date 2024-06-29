import 'package:flutter/material.dart';
import 'package:taskbuilder/Controllers/signin_controller.dart';
import 'package:taskbuilder/Screens/login.dart';
import 'package:taskbuilder/User/usermodel.dart';
import 'package:taskbuilder/User/userrepo.dart';

class SingnIn extends StatefulWidget {
  const SingnIn({super.key});

  @override
  State<SingnIn> createState() => _SingnInState();
}

class _SingnInState extends State<SingnIn> {
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Use a Container or SizedBox to set the desired size of the image
                Container(
                  width: 400, // or a specific width
                  height: 350, // or a specific height
                  child: Image(
                    image: AssetImage("assets/images/4.png"),
                    fit: BoxFit
                        .cover, // This will scale the image to cover the entire container
                  ),
                ),
                SizedBox(
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ))
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: SigninController.email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email), labelText: "E-Mail"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: SigninController.password,
                    obscureText: isvisible,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          child: isvisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        )),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () async {
                      UserModel? usermodel = await UserRepository.getuseremail(
                          SigninController.email.text);
                      SigninController.SignIn(
                          usermodel!,
                          SigninController.email.text,
                          SigninController.password.text,
                          context);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
