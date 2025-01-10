import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_training/database/repository.dart';
import 'package:bloc_training/models/user.dart';
import 'package:equatable/equatable.dart';

part 'atuth_bloc_event.dart';
part 'atuth_bloc_state.dart';

class AtuthBlocBloc extends Bloc<AtuthBlocEvent, AtuthBlocState> {
  final Repository repository;
  AtuthBlocBloc(this.repository) : super(AtuthBlocInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      try {
      //  await Future.delayed(const Duration(seconds: 2));
        final authenticated = await repository.authenticate(
            Users(username: event.username, password: event.password));
        if (authenticated) {
          //if success login
          Users usr = await repository.getLoggedInUser(event.username);
          log('message $usr');
          emit(Authenticated(usr));
        } else {
          emit(const FailureState("Username or Password is incorrect"));
        }
      } catch (c) {
        log('message $c');
        emit(FailureState("$c"));
      }
      // TODO: implement event handler
    });

    on<RegisterEvent>(
      (event, emit) async {
        emit(LoadingState());
        try {
        await  Future.delayed(const Duration(seconds: 2));
          final res = await repository.registerUser(Users(
              fullName: event.user.fullName,
              email: event.user.email,
              username: event.user.username,
              password: event.user.password));
          if (res > 0) {
            emit(SuccessRegister());
            Users usr = await repository.getLoggedInUser(event.user.username);
            emit(Authenticated(usr));
          }else{
            emit(FailureState("User ${event.user.username} already Exist"));
          }
        } catch (e) {
            emit(FailureState("$e"));

        }
      },
    );

    on<LogoutEvent>((event, emit) {
      emit(LogoutState());
    },);
  }
}
