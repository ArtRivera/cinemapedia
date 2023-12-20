import 'package:cinemapedia/src/constants/environment.dart';
import 'package:cinemapedia/src/features/movies/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_now_playing_response.dart';
import 'package:cinemapedia/src/features/movies/domain/movie.dart';
import 'package:cinemapedia/src/features/movies/data/data_sources/movie_datasource.dart';
import 'package:dio/dio.dart';

/// This is the remote data source for the movies feature. It is based on TheMovieDB API.
class RemoteMovieDataSource implements MovieDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get<Map<String, dynamic>>('/movie/now_playing',
        queryParameters: {'page': page});

    final data = response.data ?? {};

    final movies = _jsonToMovies(data);

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/popular',
        queryParameters: {'page': page});

    final data = response.data ?? {};

    final movies = _jsonToMovies(data);

    return movies;
  }

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/top_rated',
        queryParameters: {'page': page});

    final data = response.data ?? {};

    final movies = _jsonToMovies(data);

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/upcoming',
        queryParameters: {'page': page});

    final data = response.data ?? {};

    final movies = _jsonToMovies(data);

    return movies;
  }
}
