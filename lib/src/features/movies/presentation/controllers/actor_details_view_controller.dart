import 'package:cinemapedia/src/features/movies/data/repositories/cast_repository.dart';
import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actor_details_view_controller.g.dart';

@riverpod
Future<Actor> fetchActorDetails(FetchActorDetailsRef ref, String id) {
  final castRepository = ref.watch(castRepositoryProvider);
  return castRepository.getDetails(id);
}
