import 'package:cinemapedia/src/features/movies/data/models/movidb_movie.dart';
import 'package:deep_pick/deep_pick.dart';

class MovieDbResponse {
  MovieDbResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final Dates? dates;
  final int page;
  final List<MovieDBMovie> results;
  final int totalPages;
  final int totalResults;

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbResponse(
          dates: pick(json, 'dates').letOrNull(Dates.fromPick),
          page: pick(json, 'page').asIntOrThrow(),
          results: pick(json, 'results').asListOrEmpty(MovieDBMovie.fromPick),
          totalPages: pick(json, 'total_pages').asIntOrThrow(),
          totalResults: pick(json, 'total_results').asIntOrThrow());

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  factory Dates.fromPick(RequiredPick pick) => Dates(
      maximum: pick('maximum').asDateTimeOrThrow(),
      minimum: pick('minimum').asDateTimeOrThrow());

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
