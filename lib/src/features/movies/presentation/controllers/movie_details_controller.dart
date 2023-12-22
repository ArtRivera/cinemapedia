import 'package:cinemapedia/src/features/movies/data/repositories/movie_repository.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_controller.g.dart';

@Riverpod(keepAlive: true)
Future<Movie> fetchMovieDetails(FetchMovieDetailsRef ref, String movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getDetails(movieId);
}
