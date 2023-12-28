import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getDetails(String id);
  Future<List<Actor>> getCredits(String id);
}
