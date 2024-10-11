class Album {
  final String name;
  final String artist;
  final String coverImageUrl;
  final List<String> favoriteTracks;

  Album({
    required this.name,
    required this.artist,
    required this.coverImageUrl,
    required this.favoriteTracks,
  });

  Album copyWith({
    String? name,
    String? artist,
    String? coverImageUrl,
    List<String>? favoriteTracks,
  }) {
    return Album(
      name: name ?? this.name,
      artist: artist ?? this.artist,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      favoriteTracks: favoriteTracks ?? this.favoriteTracks,
    );
  }
}