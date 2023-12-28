import 'package:deep_pick/deep_pick.dart';

class MovieDbActor {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  DateTime birthday;
  DateTime? deathday;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  MovieDbActor({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory MovieDbActor.fromJson(Map<String, dynamic> json) => MovieDbActor(
        adult: pick(json, 'adult').asBoolOrThrow(),
        alsoKnownAs: pick(json, 'also_known_as')
            .asListOrThrow((it) => it.asString())
            .toList(),
        biography: pick(json, 'biography').asStringOrThrow(),
        birthday: pick(json, 'birthday').asDateTimeOrThrow(),
        deathday: pick(json, 'deathday').asDateTimeOrNull(),
        gender: pick(json, 'gender').asIntOrThrow(),
        homepage: pick(json, 'homepage').asStringOrNull(),
        id: pick(json, 'id').asIntOrThrow(),
        imdbId: pick(json, 'imdb_id').asStringOrThrow(),
        knownForDepartment:
            pick(json, 'known_for_department').asStringOrThrow(),
        name: pick(json, 'name').asStringOrThrow(),
        placeOfBirth: pick(json, 'place_of_birth').asStringOrThrow(),
        popularity: pick(json, 'popularity').asDoubleOrThrow(),
        profilePath: pick(json, 'profile_path').asStringOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
        "biography": biography,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
