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

class HomeMoviesState {
  HomeMoviesState(
      {required this.nowPlayingMovies,
      required this.popularMovies,
      required this.upcomingMovies,
      required this.topRatedMovies});

  List<Movie> nowPlayingMovies;
  List<Movie> popularMovies;
  List<Movie> upcomingMovies;
  List<Movie> topRatedMovies;

  HomeMoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? upcomingMovies,
    List<Movie>? topRatedMovies,
  }) {
    return HomeMoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    );
  }

  List<Movie> get shortPopularMoviesList {
    if (popularMovies.isEmpty) return [];

    return popularMovies.sublist(0, 6);
  }

  bool get hasDataHomeMovies {
    return nowPlayingMovies.isNotEmpty &&
        popularMovies.isNotEmpty &&
        upcomingMovies.isNotEmpty &&
        topRatedMovies.isNotEmpty;
  }
}

@riverpod
class MoviesController extends _$MoviesController {
  @override
  HomeMoviesState build() {
    return HomeMoviesState(
        nowPlayingMovies: [],
        popularMovies: [],
        upcomingMovies: [],
        topRatedMovies: []);
  }

  int currentPage = 1;

  Future<void> init() async {
    await getNowPlayingMovies();
    await getPopularMovies();
    await getUpcomingMovies();
    await getTopRatedMovies();
  }

  Future<void> getNowPlayingMovies() async {
    final movies = await ref
        .read(movieRepositoryProvider)
        .getNowPlaying(page: currentPage);

    state = state
        .copyWith(nowPlayingMovies: [...state.nowPlayingMovies, ...movies]);

    currentPage++;
  }

  Future<void> getPopularMovies() async {
    final movies =
        await ref.read(movieRepositoryProvider).getPopular(page: currentPage);

    state = state.copyWith(popularMovies: [...state.popularMovies, ...movies]);

    currentPage++;
  }

  Future<void> getUpcomingMovies() async {
    final movies =
        await ref.read(movieRepositoryProvider).getUpcoming(page: currentPage);

    state =
        state.copyWith(upcomingMovies: [...state.upcomingMovies, ...movies]);

    currentPage++;
  }

  Future<void> getTopRatedMovies() async {
    final movies =
        await ref.read(movieRepositoryProvider).getTopRated(page: currentPage);

    state =
        state.copyWith(topRatedMovies: [...state.topRatedMovies, ...movies]);

    currentPage++;
  }
}
