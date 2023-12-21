import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_response.dart';
import 'package:movieapp/utils/routes/routes_name.dart';
import 'package:movieapp/view/movie_detail/movie_detail_screen.dart';
import 'package:movieapp/view/movie_list/movie_list_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.onboard:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const OnboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MovieListScreen(),
        );
      case RoutesName.detail:
        final args = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (context) => MovieDetailScreen(
            movie: args,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
