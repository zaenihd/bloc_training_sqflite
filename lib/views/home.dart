import 'dart:developer';

import 'package:bloc_training/bloc/AuthBloc/atuth_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AtuthBlocBloc, AtuthBlocState>(
          builder: (context, state) {
            if(state is Authenticated){
            log("hehe ${state.users.toJson()} ------");
            return  Text("Hello ${state.users.fullName}");
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
