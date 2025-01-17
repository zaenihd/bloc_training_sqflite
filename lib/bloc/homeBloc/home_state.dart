part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState{}
final class LoadedUser extends HomeState{
  final List<UserCok> listUser;

  const LoadedUser({required this.listUser});

}
final class Error extends HomeState{
  final String error;

  const Error({required this.error});
}
