import 'package:cinemapedia/src/features/movies/data/models/movidb_movie.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_movie_detail.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieDBMovie movie) {
    final backdropPath = movie.backdropPath != null
        ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
        : 'https://via.placeholder.com/500x281.png?text=Image+not+found';

    final posterPath = movie.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
        : 'not+found';

    return Movie(
        adult: movie.adult,
        backdropPath: backdropPath,
        genreIds: movie.genreIds.map((id) => id.toString()).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: posterPath,
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount);
  }

  static Movie movieDBDetailsToEntity(MovieDbMovieDetails movie) {
    final backdropPath = movie.backdropPath != null
        ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
        : 'https://via.placeholder.com/500x281.png?text=Image+not+found';

    final posterPath = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';

    return Movie(
        adult: movie.adult,
        backdropPath: backdropPath,
        genreIds: movie.genres.map((genre) => genre.id.toString()).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: posterPath,
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount);
  }
}
