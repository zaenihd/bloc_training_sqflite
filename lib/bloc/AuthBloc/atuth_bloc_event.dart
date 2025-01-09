part of 'atuth_bloc_bloc.dart';

sealed class AtuthBlocEvent extends Equatable {
  const AtuthBlocEvent();
}

class LoginEvent extends AtuthBlocEvent{
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}
class RegisterEvent extends AtuthBlocEvent{
  final Users user;

  const RegisterEvent(this.user);
  @override
  List<Object> get props => [];
}

class LogoutEvent extends AtuthBlocEvent{
   @override
  List<Object> get props => [];
}
 