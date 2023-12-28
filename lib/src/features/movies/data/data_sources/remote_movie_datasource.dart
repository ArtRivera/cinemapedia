import 'package:cinemapedia/src/constants/environment.dart';
import 'package:cinemapedia/src/features/movies/data/mappers/cast_mapper.dart';
import 'package:cinemapedia/src/features/movies/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_movie_credits.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_movie_detail.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_movie_list.dart';
import 'package:cinemapedia/src/features/movies/domain/actor.dart';
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

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDBMovieList.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/now_playing',
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

  @override
  Future<Movie> getDetails(String id) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/$id');

    final data = response.data ?? {};

    final Movie movie =
        MovieMapper.movieDBDetailsToEntity(MovieDbMovieDetails.fromJson(data));

    return movie;
  }

  @override
  Future<List<Actor>> getCredits(String id) async {
    final response = await dio.get<Map<String, dynamic>>('/movie/$id/credits');

    final data = response.data ?? {};

    final movieDBCreditsCast = MovieDbMovieCredits.fromJson(data);

    final List<Actor> cast = movieDBCreditsCast.cast
        .map((e) => CastMapper.movieDBMovieCreditsToEntity(e))
        .toList();

    return cast;
  }
}
