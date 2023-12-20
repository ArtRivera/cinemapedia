import 'package:cinemapedia/src/common/common_widgets.dart';
import 'package:cinemapedia/src/features/movies/presentation/providers/home_view_controller.dart';
import 'package:cinemapedia/src/features/movies/presentation/widgets/movie_horizontal_list_view.dart';
import 'package:cinemapedia/src/features/movies/presentation/widgets/movie_slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(moviesControllerProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesControllerProvider);

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              flexibleSpace: CustomAppBar(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    MovieSlideShow(movies: movies.shortPopularMoviesList),
                    MovieHorizontalListView(
                      movies: movies.nowPlayingMovies,
                      title: 'En cines',
                      subtitle: 'Lunes 7 de diciembre',
                      onEndReached: () {
                        print('onEndReached');
                        ref
                            .read(moviesControllerProvider.notifier)
                            .getNowPlayingMovies();
                      },
                    ),
                    MovieHorizontalListView(
                      movies: movies.popularMovies,
                      title: 'Más populares',
                      subtitle: 'Tendencias de la semana',
                      onEndReached: () {
                        print('onEndReached');
                        ref
                            .read(moviesControllerProvider.notifier)
                            .getPopularMovies();
                      },
                    ),
                    MovieHorizontalListView(
                      movies: movies.upcomingMovies,
                      title: 'Próximos estrenos',
                      subtitle: 'Próximo viernes',
                      onEndReached: () {
                        print('onEndReached');
                        ref
                            .read(moviesControllerProvider.notifier)
                            .getNowPlayingMovies();
                      },
                    ),
                    MovieHorizontalListView(
                      movies: movies.topRatedMovies,
                      title: 'Mejores calificadas',
                      subtitle: 'Top películas',
                      onEndReached: () {
                        ref
                            .read(moviesControllerProvider.notifier)
                            .getNowPlayingMovies();
                      },
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
