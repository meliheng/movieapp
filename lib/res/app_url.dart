import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String imageUrl = "https://image.tmdb.org/t/p/w500";
  static String moviesUrl(int pageNumber) =>
      "https://api.themoviedb.org/3/movie/popular?api_key=${dotenv.env['API_KEY']}&page=$pageNumber";
  static String genresUrl =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=${dotenv.env['API_KEY']}";
  static String searchUrl(String query) =>
      "https://api.themoviedb.org/3/search/movie?api_key=${dotenv.env['API_KEY']}&query=$query";
}
