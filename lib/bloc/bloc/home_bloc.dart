import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_training/models/list_user.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final dio = Dio();
  HomeBloc() : super(HomeInitial()) {
    // on<HomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<LoadUser>(
      (event, emit) async {
        log("messagesss");
        emit(Loading());
        try {
          final rs = await dio.get(
            "https://reqres.in/api/users?page=${event.id}", // Set the response type to `stream`.
          );
          final user = usersListFromJson(rs.toString());
          emit(LoadedUser(listUser: user.data));
        } catch (e) {
          log("ini ke load");
          emit(Error(error: "$e"));
        }
      },
    );
  }
}
