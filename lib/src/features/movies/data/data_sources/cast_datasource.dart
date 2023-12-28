import 'package:cinemapedia/src/features/movies/domain/actor.dart';

abstract class CastDataSource {
  Future<Actor> getDetails(String id);
}
