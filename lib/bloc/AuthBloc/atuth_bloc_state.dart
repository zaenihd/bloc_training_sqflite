part of 'atuth_bloc_bloc.dart';

sealed class AtuthBlocState extends Equatable {
  const AtuthBlocState();

  @override
  List<Object> get props => [];
}

final class AtuthBlocInitial extends AtuthBlocState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends AtuthBlocState {
  @override
  List<Object> get props => [];
}
//SUCCESS LOGIN
final class Authenticated extends AtuthBlocState {
  final Users users;

  const Authenticated(this.users);
  @override
  List<Object> get props => [users];
}
//ERROR LOGIN
final class FailureState extends AtuthBlocState {
  final String error;

  const FailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class LogoutState extends AtuthBlocState {
  @override
  List<Object> get props => [];
}
final class SuccessRegister extends AtuthBlocState {
  @override
  List<Object> get props => [];
}