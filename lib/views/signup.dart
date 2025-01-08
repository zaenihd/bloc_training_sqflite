import 'package:bloc_training/components/buttons.dart';
import 'package:bloc_training/components/textfields.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    InputText(
                      controller: fullName,
                      hintText: "full Name",
                      validator: (value) {
                        if (value.toString() == "") {
                          return "fullName is required";
                        }
                        return null;
                      },
                    ),
                    InputText(
                      controller: email,
                      hintText: "email",
                      validator: (value) {
                        if (value.toString() == "") {
                          return "email is required";
                        }
                        return null;
                      },
                    ),
                    InputText(
                      controller: username,
                      hintText: "Username",
                      validator: (value) {
                        if (value.toString() == "") {
                          return "Username is required";
                        }
                        return null;
                      },
                    ),
                    InputText(
                      controller: password,
                      hintText: "password",
                      validator: (value) {
                        if (value.toString() == "") {
                          return "password is required";
                        }
                        return null;
                      },
                    ),
                    InputText(
                      controller: confirmPassword,
                      hintText: "Re-enter password",
                      validator: (value) {
                        if (value.toString() == "") {
                          return "Re-enter password is required";
                        } else if (password.text != confirmPassword.text) {
                          return "Password dont match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Button(
                      label: "Register",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ));
  }
}
