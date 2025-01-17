import 'package:bloc_training/bloc/AuthBloc/atuth_bloc_bloc.dart';
import 'package:bloc_training/bloc/homeBloc/home_bloc.dart';
import 'package:bloc_training/bloc/movieBloc/movie_bloc.dart';
import 'package:bloc_training/database/repository.dart';
import 'package:bloc_training/views/list_movie.dart';
import 'package:bloc_training/views/login.dart';
import 'package:bloc_training/views/sqflite_note/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => AtuthBlocBloc(Repository()),
      providers: [
        BlocProvider(
          create: (context) => AtuthBlocBloc(Repository()),
        ),
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
         BlocProvider(
          create: (context) => HomeBloc(),
        )
      ],
      child:
       MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ListMovie(),
      ),
    );
    // return
    //  GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home:  HomeViewSqflite(),
    //   );
  }
}
