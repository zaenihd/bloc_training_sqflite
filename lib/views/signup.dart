import 'package:bloc_training/bloc/AuthBloc/atuth_bloc_bloc.dart';
import 'package:bloc_training/components/buttons.dart';
import 'package:bloc_training/components/textfields.dart';
import 'package:bloc_training/constants/env.dart';
import 'package:bloc_training/main.dart';
import 'package:bloc_training/models/user.dart';
import 'package:bloc_training/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<AtuthBlocBloc, AtuthBlocState>(
      listener: (context, state) {
        if (state is SuccessRegister) {
          Env.gotoReplacemaent(context, const HomePage());
        } else if (state is FailureState) {
          Env.snackBar(context, state.error);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
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
                       state is LoadingState ? const CircularProgressIndicator() :
                       
                        Button(
                          label: "Register",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AtuthBlocBloc>().add(RegisterEvent(
                                  Users(
                                      fullName: fullName.text,
                                      email: email.text,
                                      username: username.text,
                                      password: password.text)));
                            }
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
      },
    );
  }
}
