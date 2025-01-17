part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];

}

class LoadUser extends HomeEvent{
  final int id;
  const LoadUser({required this.id});
  @override
  List<Object> get props => [1];
}
