import 'package:cinemapedia/src/features/movies/presentation/home_view.dart';
import 'package:go_router/go_router.dart';

class RoutePaths {
  static const home = '/';
}

final appRouter = GoRouter(initialLocation: RoutePaths.home, routes: [
  GoRoute(
    path: RoutePaths.home,
    name: HomeView.routeName,
    builder: (context, state) => const HomeView(),
  ),
]);
