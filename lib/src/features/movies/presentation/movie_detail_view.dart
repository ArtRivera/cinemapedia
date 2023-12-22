import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:cinemapedia/src/features/movies/presentation/controllers/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MovieDetailView extends ConsumerWidget {
  const MovieDetailView({super.key, required this.movieId});

  final String movieId;

  static const routeName = 'movieDetail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailsAsync = ref.watch(fetchMovieDetailsProvider(movieId));

    return Scaffold(
        body: movieDetailsAsync.when(
            data: (movie) => CustomScrollView(
                  slivers: [
                    _CustomAppBar(movie: movie),
                  ],
                ),
            error: (error, stackTrace) => Center(
                  child: Text('$error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sliverAppBarHeight = size.height * 0.7;

    return SliverAppBar(
      expandedHeight: sliverAppBarHeight,
      leading: IconButton(
        padding: const EdgeInsets.only(left: 5),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.25)),
        ),
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => context.pop(),
      ),
      foregroundColor: Colors.white.withOpacity(0.8),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        centerTitle: false,
        title: Text(
          movie.title,
          textAlign: TextAlign.start,
        ),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                  0.7,
                  1
                ],
                        colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ]))),
          ),
        ]),
      ),
    );
  }
}
