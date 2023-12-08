import 'package:deep_pick/deep_pick.dart';

class MovieDBMovie {
  MovieDBMovie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDBMovie.fromPick(RequiredPick pick) => MovieDBMovie(
      adult: pick('adult').asBoolOrThrow(),
      backdropPath: pick('backdrop_path').asStringOrNull(),
      genreIds: pick('genre_ids').asListOrEmpty<int>((id) => id.asIntOrThrow()),
      id: pick('id').asIntOrThrow(),
      originalLanguage: pick('original_language').asStringOrThrow(),
      originalTitle: pick('original_title').asStringOrThrow(),
      overview: pick('overview').asStringOrThrow(),
      popularity: pick('popularity').asDoubleOrThrow(),
      posterPath: pick('poster_path').asStringOrThrow(),
      releaseDate: pick('release_date').asDateTimeOrThrow(),
      title: pick('title').asStringOrThrow(),
      video: pick('video').asBoolOrThrow(),
      voteAverage: pick('vote_average').asDoubleOrThrow(),
      voteCount: pick('vote_count').asIntOrThrow());

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
