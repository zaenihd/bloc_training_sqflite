import 'package:bloc_training/bloc/movieBloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(LoadMovieEvent(id: 7));
    return Scaffold(
      appBar: AppBar(
        title: Text("List Movie"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is LoadingMovie) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessLoadMovie) {
            return ListView.builder(
              itemCount: state.movie.length,
              itemBuilder: (context, index) {
            final movie = state.movie[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text("Tahun ${movie.year}"),
                  leading: Image.network(
                      movie.poster),
                );
              },
            );
          } else if (state is ErrorLoadMoview) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
