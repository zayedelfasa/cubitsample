import 'package:cubitloginsample/views/movies/movies_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cubitloginsample/views/movies/cubit/movies_cubit.dart';
import 'package:cubitloginsample/views/movies/cubit/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesView extends StatelessWidget {
  final moviesCubit = MoviesCubit(moviesRepository: MoviesRepository(Dio()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trending Movies"),
        ),
        body: BlocProvider(
            create: (context) => moviesCubit,
            child: BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessLoadingState) {
                  final movies = state.movies;

                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(movies[index].title),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(movies[index].urlImage),
                        ),
                      ),
                    ),
                  );
                } else if (state is FailureState) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                } else {
                  return Container();
                }
              },
            )));
  }
}
