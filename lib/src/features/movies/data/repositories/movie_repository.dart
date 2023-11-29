import 'package:cinemapedia/src/features/movies/data/data_sources/movie_datasource.dart';
import 'package:cinemapedia/src/features/movies/data/data_sources/remote_movie_datasource.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class _IMovieRepository {
  Future<List<Movie>> getNowPlayingMovies({int page = 1});
}

class MovieRepository implements _IMovieRepository {
  MovieRepository({required MovieDataSource dataSource})
      : _movieDataSource = dataSource;

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final movies = await _movieDataSource.getNowPlayingMovies(page: page);

    return movies;
  }
}

// This is the provider for the movie repository.
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final movieDataSource = RemoteMovieDataSource();

  return MovieRepository(dataSource: movieDataSource);
});
