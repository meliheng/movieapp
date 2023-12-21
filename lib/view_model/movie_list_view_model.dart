import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie_list_state.dart';
import 'package:movieapp/repository/movie_repository.dart';

final movieListViewModelProvider =
    StateNotifierProvider<MovieListViewModel, MovieListState>(
  (ref) {
    return MovieListViewModel(MovieListState.initial());
  },
);

class MovieListViewModel extends StateNotifier<MovieListState> {
  MovieListViewModel([
    MovieListState? state,
  ]) : super(state ?? MovieListState.initial()) {
    initialMovies();
  }
  final MovieRepository movieRepository = MovieRepository();
  Future<void> getMovies() async {
    try {
      final movies = await movieRepository.getMovie(state.page);
      state = state.copyWith(
        movies: [...state.movies, ...movies],
        filteredMovies: [...state.movies, ...movies],
        page: state.page + 1,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future initialMovies() async {
    state = state.copyWith(fetchEnum: PageStatus.firstPageLoading);
    try {
      await getMovies();
      state = state.copyWith(fetchEnum: PageStatus.firstPageLoaded);
    } catch (e) {
      state = state.copyWith(fetchEnum: PageStatus.firstPageError);
      state.errorMessage = e.toString();
    }
  }

  Future loadMoreMovies(ScrollController scrollController) async {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        state.pageStatus != PageStatus.newPageLoading) {
      state = state.copyWith(fetchEnum: PageStatus.newPageLoading);
      try {
        await getMovies();
        state = state.copyWith(fetchEnum: PageStatus.newPageLoaded);
      } catch (e) {
        state = state.copyWith(fetchEnum: PageStatus.newPageError);
        state.errorMessage = e.toString();
      }
    }
  }

  Future<void> getMoviesByQuery(String query) async {
    state = state.copyWith(
      fetchEnum: PageStatus.firstPageLoading,
      filterText: query,
    );
    if (state.filterText.length >= 2) {
      try {
        final movies = await movieRepository.getMovieByQuery(state.filterText);
        state = state.copyWith(
          filteredMovies: movies,
          fetchEnum: PageStatus.firstPageLoaded,
        );
      } catch (e) {
        state = state.copyWith(
          fetchEnum: PageStatus.firstPageError,
          errorMessage: e.toString(),
        );
        rethrow;
      }
    } else {
      state = state.copyWith(
        filteredMovies: state.movies,
        fetchEnum: PageStatus.firstPageLoaded,
      );
    }
  }

  void clearFilterText() {
    state = state.copyWith(
      filterText: '',
      filteredMovies: state.movies,
      fetchEnum: PageStatus.firstPageLoaded,
    );
  }
}
