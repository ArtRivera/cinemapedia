import 'package:cinemapedia/src/features/movies/data/data_sources/movie_datasource.dart';
import 'package:cinemapedia/src/features/movies/data/data_sources/remote_movie_datasource.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository.g.dart';

abstract class _IMovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
}

class MovieRepository implements _IMovieRepository {
  MovieRepository({required MovieDataSource dataSource})
      : _movieDataSource = dataSource;

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _movieDataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _movieDataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _movieDataSource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _movieDataSource.getUpcoming(page: page);
  }
}

// The older version of the provider.
// // This is the provider for the movie repository.
// final movieRepositoryProvider = Provider<MovieRepository>((ref) {
//   final movieDataSource = RemoteMovieDataSource();

//   return MovieRepository(dataSource: movieDataSource);
// });

// This is the provider for the movie repository.
@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {

  final movieDataSource = RemoteMovieDataSource();

  return MovieRepository(dataSource: movieDataSource);
}
