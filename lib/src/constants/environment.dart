import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get theMovieDBKey =>
      dotenv.env['THE_MOVIE_DB_KEY'] ?? 'Key not found';
}
