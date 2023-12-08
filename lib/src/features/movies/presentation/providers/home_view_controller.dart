import 'package:cinemapedia/src/features/movies/data/repositories/movie_repository.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_controller.g.dart';

// The older version of the provider.
// class MoviesController extends StateNotifier<List<Movie>> {
//   MoviesController({required this.movieRepository}) : super([]);

//   final MovieRepository movieRepository;

//   int currentPage = 1;

//   Future<void> getNowPlayingMovies() async {
//     final movies = await movieRepository.getNowPlayingMovies(page: currentPage);

//     state = [...state, ...movies];

//     currentPage++;
//   }
// }

// final moviesControllerProvider =
//     StateNotifierProvider<MoviesController, List<Movie>>((ref) {
//   final movieRepository = ref.watch(movieRepositoryProvider);

//   return MoviesController(movieRepository: movieRepository);
// });

@riverpod
class MoviesController extends _$MoviesController {
  @override
  List<Movie> build() {
    return [];
  }

  int currentPage = 1;

  Future<void> getNowPlayingMovies() async {
    final movies = await ref
        .read(movieRepositoryProvider)
        .getNowPlayingMovies(page: currentPage);

    state = [...state, ...movies];

    currentPage++;
  }
}
