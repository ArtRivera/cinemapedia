import 'package:deep_pick/deep_pick.dart';

class MovieDbMovieDetails {
  bool adult;
  String? backdropPath;
  String? belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDbMovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDbMovieDetails.fromJson(Map<String, dynamic> json) =>
      MovieDbMovieDetails(
        adult: pick(json, 'adult').asBoolOrThrow(),
        backdropPath: pick(json, 'backdrop_path').asStringOrNull(),
        belongsToCollection:
            pick(json, 'belongs_to_collection').asStringOrNull(),
        budget: pick(json, 'budget').asIntOrThrow(),
        genres: pick(json, 'genres').asListOrEmpty(Genre.fromPick).toList(),
        homepage: pick(json, 'homepage').asStringOrThrow(),
        id: pick(json, 'id').asIntOrThrow(),
        imdbId: pick(json, 'imdb_id').asStringOrThrow(),
        originalLanguage: pick(json, 'original_language').asStringOrThrow(),
        originalTitle: pick(json, 'original_title').asStringOrThrow(),
        overview: pick(json, 'overview').asStringOrThrow(),
        popularity: pick(json, 'popularity').asDoubleOrThrow(),
        posterPath: pick(json, 'poster_path').asStringOrThrow(),
        productionCompanies: pick(json, 'production_companies')
            .asListOrEmpty(ProductionCompany.fromPick)
            .toList(),
        productionCountries: pick(json, 'production_countries')
            .asListOrEmpty(ProductionCountry.fromPick)
            .toList(),
        releaseDate: pick(json, 'release_date').asDateTimeOrThrow(),
        revenue: pick(json, 'revenue').asIntOrThrow(),
        runtime: pick(json, 'runtime').asIntOrThrow(),
        spokenLanguages: pick(json, 'spoken_languages')
            .asListOrEmpty(SpokenLanguage.fromPick)
            .toList(),
        status: pick(json, 'status').asStringOrThrow(),
        tagline: pick(json, 'tagline').asStringOrThrow(),
        title: pick(json, 'title').asStringOrThrow(),
        video: pick(json, 'video').asBoolOrThrow(),
        voteAverage: pick(json, 'vote_average').asDoubleOrThrow(),
        voteCount: pick(json, 'vote_count').asIntOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
      id: pick(json, 'id').asIntOrThrow(),
      name: pick(json, 'name').asStringOrThrow());

  factory Genre.fromPick(RequiredPick pick) => Genre(
        id: pick('id').asIntOrThrow(),
        name: pick('name').asStringOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: pick(json, 'id').asIntOrThrow(),
        logoPath: pick(json, 'logo_path').asStringOrNull(),
        name: pick(json, 'name').asStringOrThrow(),
        originCountry: pick(json, 'origin_country').asStringOrThrow(),
      );

  factory ProductionCompany.fromPick(RequiredPick pick) => ProductionCompany(
        id: pick('id').asIntOrThrow(),
        logoPath: pick('logo_path').asStringOrNull(),
        name: pick('name').asStringOrThrow(),
        originCountry: pick('origin_country').asStringOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: pick(json, 'iso_3166_1').asStringOrThrow(),
        name: pick(json, 'name').asStringOrThrow(),
      );

  factory ProductionCountry.fromPick(RequiredPick pick) => ProductionCountry(
        iso31661: pick('iso_3166_1').asStringOrThrow(),
        name: pick('name').asStringOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: pick(json, 'english_name').asStringOrThrow(),
        iso6391: pick(json, 'iso_639_1').asStringOrThrow(),
        name: pick(json, 'name').asStringOrThrow(),
      );

  factory SpokenLanguage.fromPick(RequiredPick pick) => SpokenLanguage(
        englishName: pick('english_name').asStringOrThrow(),
        iso6391: pick('iso_639_1').asStringOrThrow(),
        name: pick('name').asStringOrThrow(),
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
