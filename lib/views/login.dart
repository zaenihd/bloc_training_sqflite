import 'package:bloc_training/bloc/AuthBloc/atuth_bloc_bloc.dart';
import 'package:bloc_training/bloc/homeBloc/home_bloc.dart';
import 'package:bloc_training/components/buttons.dart';
import 'package:bloc_training/components/textfields.dart';
import 'package:bloc_training/constants/env.dart';
import 'package:bloc_training/main.dart';
import 'package:bloc_training/views/home.dart';
import 'package:bloc_training/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController(text: "zezen123");
  final password = TextEditingController(text: "zezen123");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtuthBlocBloc, AtuthBlocState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // BlocProvider(
          //   create: (context) => HomeBloc(),
          //   child: 
          // );
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
                        state is LoadingState
                            ? const CircularProgressIndicator()
                            : Button(
                                label: "Login",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AtuthBlocBloc>().add(
                                        LoginEvent(
                                            username: username.text,
                                            password: password.text));
                                  }
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
      },
    );
  }
}
