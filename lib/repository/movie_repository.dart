import 'package:movieapp/data/network/network_api_services.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/models/movie_response.dart';
import 'package:movieapp/res/app_url.dart';
import 'package:riverpod/riverpod.dart';

final movieServiceProvider = Provider((ref) => MovieRepository());

class MovieRepository {
  final NetworkApiServices networkApiServices = NetworkApiServices();

  Future<List<Movie>> getMovie(int pageNumber) async {
    dynamic response = await networkApiServices.getGetApiResponse(
      AppUrl.moviesUrl(pageNumber),
    );
    return response = MovieResponse.fromJson(response).movies;
  }

  Future<List<Movie>> getMovieByQuery(String query) async {
    dynamic response =
        await networkApiServices.getGetApiResponse(AppUrl.searchUrl(query));
    return response = MovieResponse.fromJson(response).movies;
  }

  Future<List<Genre>> getGenres() async {
    dynamic response =
        await networkApiServices.getGetApiResponse(AppUrl.genresUrl);
    List<Genre> genres = [];
    for (var element in response['genres']) {
      genres.add(Genre.fromJson(element));
    }
    return Future.value(genres);
  }
}
