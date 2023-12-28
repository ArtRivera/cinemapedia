import 'package:cinemapedia/src/constants/environment.dart';
import 'package:cinemapedia/src/features/movies/data/data_sources/cast_datasource.dart';
import 'package:cinemapedia/src/features/movies/data/mappers/cast_mapper.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_actor.dart';
import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:dio/dio.dart';

class RemoteCastDataSource implements CastDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX'
      }));

  @override
  Future<Actor> getDetails(String id) async {
    final response = await dio.get<Map<String, dynamic>>('/person/$id');

    final data = response.data ?? {};

    final movieDBActor = MovieDbActor.fromJson(data);

    final actor = CastMapper.movieDBActorDetailsToEntity(movieDBActor);

    return actor;
  }
}
