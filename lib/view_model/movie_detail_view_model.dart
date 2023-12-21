import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/models/movie_response.dart';
import 'package:movieapp/repository/movie_repository.dart';

final movieDetailViewModel = Provider((ref) => MovieDetailViewModel());

class MovieDetailViewModel {
  Future<List<Genre>> getGenres(Movie movie) async {
    final MovieRepository movieRepository = MovieRepository();
    try {
      var response = await movieRepository.getGenres();
      var list = response.where((e) => movie.genreIds!.contains(e.id)).toList();
      return list;
    } on SocketException catch (_) {
      rethrow;
    } on TimeoutException catch (_) {
      rethrow;
    }
  }
}
