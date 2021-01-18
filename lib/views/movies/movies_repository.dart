import 'package:cubitloginsample/models/movie.dart';
import 'package:dio/dio.dart';

class MoviesRepository {
  final Dio client;

  MoviesRepository(this.client);

  Future<List<MovieModel>> getMovies() async {
    try {
      final url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      final response = await client.get(url);

      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
          (json) => MovieModel(
            title: json['title'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          )
        )
      );

      return movies;
    } catch (e) {
      throw e;
    }
  }
}
