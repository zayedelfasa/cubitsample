import 'package:bloc/bloc.dart';
import 'package:cubitloginsample/views/login/login_state.dart';
import 'package:cubitloginsample/views/movies/movies_repository.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({this.moviesRepository}) : super(InitialState()) {
    _getTrendingMovies();
  }

  final MoviesRepository moviesRepository;

  void _getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await moviesRepository.getMovies();
      emit(SuccessLoadingState(movies));
    } catch (e) {}
  }
}
