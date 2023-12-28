import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:cinemapedia/src/features/movies/presentation/controllers/movie_details_controller.dart';
import 'package:cinemapedia/src/features/movies/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:cinemapedia/src/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MovieDetailView extends ConsumerWidget {
  const MovieDetailView({super.key, required this.movieId});

  final String movieId;

  static const routeName = 'movieDetail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailsAsync = ref.watch(fetchMovieDetailsProvider(movieId));
    final movieCastAsync = ref.watch(fetchMovieCastProvider(movieId));

    return Scaffold(
        body: movieDetailsAsync.when(
            data: (movie) => CustomScrollView(
                  slivers: [
                    CustomSliverAppBar(backdropPath: movie.posterPath),
                    _MovieDescription(movie: movie, cast: movieCastAsync),
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

class _MovieDescription extends StatelessWidget {
  const _MovieDescription({required this.movie, required this.cast});

  final Movie movie;
  final AsyncValue<List<Actor>> cast;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            movie.posterPath,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Wrap(
                          spacing: 5,
                          children: movie.genres
                              .map((genre) => Chip(
                                  backgroundColor:
                                      Theme.of(context).splashColor,
                                  label: Text(genre.name)))
                              .toList(),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sinopsis',
                          style: Theme.of(context).textTheme.headlineLarge),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              movie.overview,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Fecha de estreno: ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: DateFormat.yMMMd('es_MX')
                                            .format(movie.releaseDate),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                  ]),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    ),
                    cast.when(
                        data: (cast) => _MovieCast(cast: cast),
                        error: (error, stackTrace) => Text('$error'),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ))
                  ],
                )));
  }
}

class _MovieCast extends StatelessWidget {
  const _MovieCast({required this.cast});

  final List<Actor> cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          final actor = cast[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context
                      .pushNamed(Routes.actorDetail.name, pathParameters: {
                    'id': actor.id.toString(),
                  }),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      actor.profilePath,
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                // Nombre del actor
                Text(
                  actor.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                // Personaje
                Text(
                  actor.character,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
