import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:cinemapedia/src/helpers/human_formats.dart';
import 'package:cinemapedia/src/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListView extends StatefulWidget {
  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      required this.title,
      required this.subtitle,
      this.onEndReached});

  final List<Movie> movies;
  final String title;
  final String subtitle;
  final VoidCallback? onEndReached;

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();

  bool shouldTriggerOnEndReached = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      final isNearScrollEnd = scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200;

      if (isNearScrollEnd) {
        if (shouldTriggerOnEndReached) {
          widget.onEndReached?.call();
          shouldTriggerOnEndReached = false;
        }
      } else {
        // Enable onEndReached trigger
        shouldTriggerOnEndReached = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ListHeading(title: widget.title, subtitle: widget.subtitle),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ListView.builder(
              itemCount: widget.movies.length,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final movie = widget.movies[index];

                return GestureDetector(
                    onTap: () {
                      context.pushNamed(RoutePaths.movieDetail.name,
                          pathParameters: {
                            'id': movie.id.toString(),
                          });
                    },
                    child: FadeInRight(child: _MovieItem(movie: movie)));
              }),
        ),
      ],
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(movie.posterPath)),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star_half_rounded, color: Colors.orange),
                  Expanded(
                    child: Text(movie.voteAverage.toStringAsPrecision(2),
                        style: textTheme.bodyLarge?.copyWith(
                            color: Colors.orange, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    HumanFormat.number(movie.popularity),
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.thumb_up,
                    color: colorScheme.primary,
                    size: 15,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _ListHeading extends StatelessWidget {
  const _ListHeading({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
          FilledButton(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () => {},
              child: Text(subtitle))
        ],
      ),
    );
  }
}
