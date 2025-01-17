import 'dart:developer';

import 'package:bloc_training/bloc/AuthBloc/atuth_bloc_bloc.dart';
import 'package:bloc_training/bloc/homeBloc/home_bloc.dart';
import 'package:bloc_training/constants/env.dart';
import 'package:bloc_training/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const LoadUser(id: 2));
    log('message');
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<AtuthBlocBloc, AtuthBlocState>(
            listener: (context, state) {
              if (state is LogoutState) {
                Env.gotoReplacemaent(context, const LoginPage());
              }
              // TODO: implement listener
            },
            child: IconButton(
                onPressed: () {
                  context.read<AtuthBlocBloc>().add(LogoutEvent());
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.amber,
                )),
          )
        ],
        title: BlocBuilder<AtuthBlocBloc, AtuthBlocState>(
          builder: (context, state) {
            if (state is Authenticated) {
              // log("hehe ${state.users.toJson()} ------");
              return Text("Hello ${state.users.fullName}");
            }
            return const SizedBox();
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        // bloc: HomeBloc(),
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedUser) {
            return ListView.builder(
                itemCount: state.listUser.length,
                itemBuilder: (context, index) {
                  final user = state.listUser[index];
                  return ListTile(
                    leading: Image.network(user.avatar),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email),
                  );
                });
          } else if (state is Error) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container(
            child: InkWell(
                onTap: () {
                  context.read<HomeBloc>().add(const LoadUser(id: 2));
                },
                child: Text("$state")),
          );
        },
      ),
    );
  }
}
