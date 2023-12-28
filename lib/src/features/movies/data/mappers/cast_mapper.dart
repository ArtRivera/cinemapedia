import 'package:cinemapedia/src/features/movies/data/models/moviedb_actor.dart';
import 'package:cinemapedia/src/features/movies/data/models/moviedb_movie_credits.dart';

import '../../domain/actor.dart';

class CastMapper {
  static Actor movieDBMovieCreditsToEntity(
      MovieDBCreditsCast movieDbMovieCredits) {
    final profilePath = movieDbMovieCredits.profilePath == null
        ? 'https://via.placeholder.com/500x281.png?text=Image+not+found'
        : 'https://image.tmdb.org/t/p/w500${movieDbMovieCredits.profilePath}';

    final character = movieDbMovieCredits.character == null
        ? 'Unknown'
        : '${movieDbMovieCredits.character}';

    return Actor(
      id: movieDbMovieCredits.id,
      name: movieDbMovieCredits.name,
      character: character,
      profilePath: profilePath,
      birthday: DateTime.now(),
    );
  }

  static Actor movieDBActorDetailsToEntity(MovieDbActor actor) {
    final profilePath = actor.profilePath == null
        ? 'https://via.placeholder.com/500x281.png?text=Image+not+found'
        : 'https://image.tmdb.org/t/p/w500${actor.profilePath}';

    return Actor(
      id: actor.id,
      name: actor.name,
      character: actor.knownForDepartment,
      profilePath: profilePath,
      birthday: actor.birthday,
      deathday: actor.deathday,
      placeOfBirth: actor.placeOfBirth,
      bio: actor.biography,
    );
  }
}
