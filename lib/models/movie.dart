class Movie {
  final int voteCount;
  final int id;
  final bool video;
  final dynamic voteAverage;
  final String title;
  final num popularity;
  final String posterPath;
  final String originalTitle;
  final List<dynamic> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      voteCount: json['vote_count'],
      id: json['id'],
      video: json['video'],
      voteAverage: json['vote_average'],
      title: json['title'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }
}