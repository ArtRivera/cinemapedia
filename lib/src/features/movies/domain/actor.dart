class Actor {
  Actor({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
    this.bio = '',
    required this.birthday,
    this.deathday,
    this.placeOfBirth = '',
  });

  final int id;
  final String name;
  final String character;
  final String profilePath;
  final String bio;
  final DateTime birthday;
  final DateTime? deathday;
  final String placeOfBirth;
}
