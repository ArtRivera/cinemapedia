import 'package:cinemapedia/src/features/movies/domain/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getNowPlayingMovies({int page = 1});
}
