import 'package:movieapp/models/movie_response.dart';

enum PageStatus {
  idle,
  firstPageLoading,
  firstPageLoaded,
  firstPageError,
  newPageLoading,
  newPageLoaded,
  newPageError,
  newPageNoItemsFound,
}

// extension FetchEnumX on FetchEnum {
//   bool get isNotStarted => this == FetchEnum.notStarted;
//   bool get isLoading => this == FetchEnum.loading;
//   bool get isErrored => this == FetchEnum.errored;
//   bool get isFetched => this == FetchEnum.fetched;
// }

class MovieListState {
  List<Movie> movies;
  List<Movie> filteredMovies;
  int page;
  String errorMessage;
  PageStatus fetchEnum;
  String filterText;

  MovieListState({
    required this.movies,
    required this.filteredMovies,
    required this.page,
    required this.errorMessage,
    required this.fetchEnum,
    required this.filterText,
  });
  factory MovieListState.initial() {
    return MovieListState(
      movies: [],
      page: 1,
      errorMessage: '',
      fetchEnum: PageStatus.idle,
      filterText: '',
      filteredMovies: [],
    );
  }

  MovieListState copyWith({
    List<Movie>? movies,
    List<Movie>? filteredMovies,
    int? page,
    String? errorMessage,
    PageStatus? fetchEnum,
    String? filterText,
  }) {
    return MovieListState(
      movies: movies ?? this.movies,
      filteredMovies: filteredMovies ?? this.filteredMovies,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
      fetchEnum: fetchEnum ?? this.fetchEnum,
      filterText: filterText ?? this.filterText,
    );
  }
}
