import 'package:movieapp/models/movie_response.dart';

// For Handle Page State For Example Is Loading, Error etc.
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

extension PageStatusX on PageStatus {
  bool get isfirstPageLoading => this == PageStatus.firstPageLoading;
  bool get isfirstPageLoaded => this == PageStatus.firstPageLoaded;
  bool get isfirstPageError => this == PageStatus.firstPageError;
  bool get isNewPageLoading => this == PageStatus.newPageLoading;
  bool get isNewPageLoaded => this == PageStatus.newPageLoaded;
  bool get isNewPageError => this == PageStatus.newPageError;
}

class MovieListState {
  List<Movie> movies;
  List<Movie> filteredMovies;
  int page;
  String errorMessage;
  PageStatus pageStatus;
  String filterText;

  MovieListState({
    required this.movies,
    required this.filteredMovies,
    required this.page,
    required this.errorMessage,
    required this.pageStatus,
    required this.filterText,
  });
  factory MovieListState.initial() {
    return MovieListState(
      movies: [],
      page: 1,
      errorMessage: '',
      pageStatus: PageStatus.idle,
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
      pageStatus: fetchEnum ?? this.pageStatus,
      filterText: filterText ?? this.filterText,
    );
  }
}
