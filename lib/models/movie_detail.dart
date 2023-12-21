import 'package:movieapp/models/genre.dart';

class MovieDetail {
  final List<Genre> genres;
  final List<int> movieGenreIds;

  MovieDetail({
    required this.genres,
    required this.movieGenreIds,
  });
  factory MovieDetail.initial() {
    return MovieDetail(
      genres: [],
      movieGenreIds: [],
    );
  }

  MovieDetail copyWith({
    List<Genre>? genres,
    List<int>? movieGenreIds,
  }) {
    return MovieDetail(
      genres: genres ?? this.genres,
      movieGenreIds: movieGenreIds ?? this.movieGenreIds,
    );
  }
}
