import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:cinemapedia/src/features/movies/presentation/providers/home_view_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_slide_show_provider.g.dart';

@riverpod
List<Movie> slideShow(SlideShowRef ref) {
  final movies = ref.watch(moviesControllerProvider);

  if (movies.isEmpty) return [];

  return movies.sublist(0, 6);
}
