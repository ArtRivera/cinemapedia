import 'package:cinemapedia/src/features/movies/presentation/actor_details_view.dart';
import 'package:cinemapedia/src/features/movies/presentation/home_view.dart';
import 'package:cinemapedia/src/features/movies/presentation/movie_detail_view.dart';
import 'package:go_router/go_router.dart';

// Enhanced enum
enum Routes {
  home('/', 'home'),
  movieDetail('movie/:id', 'movieDetail'),
  actorDetail('actor/:id', 'actorDetail');

  const Routes(this.path, this.name);
  final String path;
  final String name;
}

final appRouter = GoRouter(initialLocation: Routes.home.path, routes: [
  GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: Routes.movieDetail.path,
          name: Routes.movieDetail.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieDetailView(movieId: movieId);
          },
        ),
        GoRoute(
          path: Routes.actorDetail.path,
          name: Routes.actorDetail.name,
          builder: (context, state) {
            final actorId = state.pathParameters['id'] ?? 'no-id';
            return ActorDetailsView(actorId: actorId);
          },
        ),
      ]),
]);
