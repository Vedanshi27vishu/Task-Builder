import 'package:flutter/material.dart';
import 'package:taskbuilder/Controllers/signup_controllers.dart';
import 'package:taskbuilder/Helperfunction/helper.dart';
import 'package:taskbuilder/Screens/login.dart';
import 'package:taskbuilder/User/userrepo.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isvisible = true;
  bool ischecked = true;

  @override
  Widget build(BuildContext context) {
    final dark = Helperfunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 60,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.arrow_back),
                color: dark ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Let's Create Your Account,",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 24),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: SignupController.firstName,
                            decoration: InputDecoration(
                              labelText: "First Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: SignupController.lastName,
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: SignupController.username,
                      decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: SignupController.email,
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: SignupController.phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: SignupController.password,
                      obscureText: isvisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          child: Icon(
                            isvisible ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Checkbox(
                          value: ischecked,
                          onChanged: (value) {
                            setState(() {
                              ischecked = value!;
                            });
                          },
                          checkColor: Color.fromARGB(255, 4, 50, 88),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: "Privacy Policy ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                      ),
                                ),
                                TextSpan(
                                  text: "and ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: "Terms of use",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () async {
                          UserRepository.createUser(
                              SignupController.createUser(), context);
                          SignupController.SignUp(SignupController.email.text,
                              SignupController.password.text, context);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
