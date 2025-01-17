part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieEvent extends MovieEvent{
  final int id;

  LoadMovieEvent({required this.id});
}
