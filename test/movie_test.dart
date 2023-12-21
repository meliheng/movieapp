import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/repository/movie_repository.dart';

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });
  test('whenGetMoviesCallThenShouldReturnMovieList', () async {
    MovieRepository movieRepository = MovieRepository();

    var response = await movieRepository.getMovie(1);
    expect(response.isNotEmpty, true);
  });
  test('whenGetMoviesByQueryCallThenShouldReturnMovieList', () async {
    MovieRepository movieRepository = MovieRepository();

    var response = await movieRepository.getMovieByQuery('wonka');
    expect(response.isNotEmpty, true);
  });
  test('whenGetGenresCallThenShouldReturnGenreList', () async {
    MovieRepository movieRepository = MovieRepository();

    var response = await movieRepository.getGenres();
    expect(response.isNotEmpty, true);
  });
}
