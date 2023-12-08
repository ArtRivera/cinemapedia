import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:flutter/material.dart';

class MovieSlideShow extends StatelessWidget {
  const MovieSlideShow({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SizedBox(
        height: 210,
        // width: double.infinity,
        child: Swiper(
          itemCount: movies.length,
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return _Slide(movie: movie);
          },
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 10),
              builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary,
                color: colors.secondary,
              )),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 10))
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return FadeIn(child: child);

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
      ),
    );
  }
}
