part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class LoadingMovie extends MovieState {}

final class SuccessLoadMovie extends MovieState {
  final List<ListMovie> movie;

  SuccessLoadMovie({required this.movie});
}

final class ErrorLoadMoview extends MovieState {
  final String error;

  ErrorLoadMoview({required this.error});
}
