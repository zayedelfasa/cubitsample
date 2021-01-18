import 'package:cubitloginsample/models/movie.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState {}

class SuccessLoadingState extends MoviesState {
  SuccessLoadingState(this.movies);
  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

class FailureState extends MoviesState {
  final String errorMessage;

  FailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'FailureLoginState{errorMessage: $errorMessage}';
  }
}
