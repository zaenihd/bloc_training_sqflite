import 'package:bloc/bloc.dart';
import 'package:bloc_training/models/movie.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final dio = Dio();

  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadMovieEvent>(
      (event, emit) async {
        emit(LoadingMovie());
        try {
          final rs = await dio.get(
            "http://www.omdbapi.com/?apikey=9a76d076&s=new&page=${event.id}", // Set the response type to `stream`.
          );
          final movie = movieFromJson(rs.toString());
          emit(SuccessLoadMovie(movie: movie.listMovie));
        } catch (e) {
          emit(ErrorLoadMoview(error: "$e"));
        }
      },
    );
  }
}
