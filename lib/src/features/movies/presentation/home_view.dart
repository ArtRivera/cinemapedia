import 'package:cinemapedia/src/features/movies/presentation/home_view_controller.dart';
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

    ref.read(moviesControllerProvider.notifier).getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
              );
            }));
  }
}
