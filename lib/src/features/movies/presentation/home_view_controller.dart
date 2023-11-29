import 'package:cinemapedia/src/features/movies/data/repositories/movie_repository.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesController extends StateNotifier<List<Movie>> {
  MoviesController({required this.movieRepository}) : super([]);

  final MovieRepository movieRepository;

  int currentPage = 1;

  Future<void> getNowPlayingMovies() async {
    final movies = await movieRepository.getNowPlayingMovies(page: currentPage);

    state = [...state, ...movies];

    currentPage++;
  }
}

final moviesControllerProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MoviesController(movieRepository: movieRepository);
});
