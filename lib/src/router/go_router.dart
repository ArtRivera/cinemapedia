import 'package:cinemapedia/src/features/movies/presentation/home_view.dart';
import 'package:cinemapedia/src/features/movies/presentation/movie_detail_view.dart';
import 'package:go_router/go_router.dart';

// Enhanced enum
enum RoutePaths {
  home('/', HomeView.routeName),
  movieDetail('movie/:id', MovieDetailView.routeName);

  const RoutePaths(this.path, this.name);
  final String path;
  final String name;

  String pathWith(String id) =>
      path.replaceAllMapped(RegExp(r":(.*)"), (match) => id);
}

final appRouter = GoRouter(initialLocation: RoutePaths.home.path, routes: [
  GoRoute(
      path: RoutePaths.home.path,
      name: HomeView.routeName,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: RoutePaths.movieDetail.path,
          name: MovieDetailView.routeName,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieDetailView(movieId: movieId);
          },
        ),
      ]),
]);
