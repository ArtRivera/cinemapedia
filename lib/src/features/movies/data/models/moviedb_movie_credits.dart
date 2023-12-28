import 'package:deep_pick/deep_pick.dart';

class MovieDbMovieCredits {
  int id;
  List<MovieDBCreditsCast> cast;
  List<MovieDBCreditsCast> crew;

  MovieDbMovieCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieDbMovieCredits.fromJson(Map<String, dynamic> json) =>
      MovieDbMovieCredits(
        id: pick(json, 'id').asIntOrThrow(),
        cast: pick(json, 'cast').asListOrThrow((MovieDBCreditsCast.fromPick)),
        crew: pick(json, 'crew').asListOrThrow((MovieDBCreditsCast.fromPick)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class MovieDBCreditsCast {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;

  MovieDBCreditsCast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory MovieDBCreditsCast.fromJson(Map<String, dynamic> json) =>
      MovieDBCreditsCast(
        adult: pick(json, 'adult').asBoolOrThrow(),
        gender: pick(json, 'gender').asIntOrThrow(),
        id: pick(json, 'id').asIntOrThrow(),
        knownForDepartment:
            pick(json, 'known_for_department').asStringOrThrow(),
        name: pick(json, 'name').asStringOrThrow(),
        originalName: pick(json, 'original_name').asStringOrThrow(),
        popularity: pick(json, 'popularity').asDoubleOrThrow(),
        profilePath: pick(json, 'profile_path').asStringOrNull(),
        castId: pick(json, 'cast_id').asIntOrNull(),
        character: pick(json, 'character').asStringOrNull(),
        creditId: pick(json, 'credit_id').asStringOrThrow(),
        order: pick(json, 'order').asIntOrNull(),
        department: pick(json, 'department').asStringOrNull(),
        job: pick(json, 'job').asStringOrNull(),
      );

  factory MovieDBCreditsCast.fromPick(RequiredPick pick) => MovieDBCreditsCast(
        adult: pick('adult').asBoolOrThrow(),
        gender: pick('gender').asIntOrThrow(),
        id: pick('id').asIntOrThrow(),
        knownForDepartment: pick('known_for_department').asStringOrThrow(),
        name: pick('name').asStringOrThrow(),
        originalName: pick('original_name').asStringOrThrow(),
        popularity: pick('popularity').asDoubleOrThrow(),
        profilePath: pick('profile_path').asStringOrNull(),
        castId: pick('cast_id').asIntOrNull(),
        character: pick('character').asStringOrNull(),
        creditId: pick('credit_id').asStringOrThrow(),
        order: pick('order').asIntOrNull(),
        department: pick('department').asStringOrNull(),
        job: pick('job').asStringOrNull(),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
