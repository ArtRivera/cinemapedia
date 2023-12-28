import 'package:cinemapedia/src/features/movies/data/data_sources/cast_datasource.dart';
import 'package:cinemapedia/src/features/movies/data/data_sources/remote_cast_data_source.dart';
import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cast_repository.g.dart';

abstract class _ICastRepository {
  Future<Actor> getDetails(String id);
}

class CastRepository implements _ICastRepository {
  CastRepository({required CastDataSource dataSource})
      : _castDataSource = dataSource;

  final CastDataSource _castDataSource;

  @override
  Future<Actor> getDetails(String id) {
    return _castDataSource.getDetails(id);
  }
}

@riverpod
CastRepository castRepository(CastRepositoryRef ref) {
  final castDataSource = RemoteCastDataSource();
  return CastRepository(dataSource: castDataSource);
}
