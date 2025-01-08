import 'package:bloc_training/components/buttons.dart';
import 'package:bloc_training/components/textfields.dart';
import 'package:bloc_training/views/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
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
                    Image.network(
                      "https://picsum.photos/seed/picsum/300/300",
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20.0,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Button(
                      label: "Login",
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
                        const Text("Don't have an account?"),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ));
                          },
                          child: const Text(
                            "Register",
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
