import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_response.dart';
import 'package:movieapp/res/components/default_poster_widget.dart';
import 'package:movieapp/res/components/poster_widget.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final Function()? onTap;
  final double? width;
  final double? height;
  const MovieItem({
    Key? key,
    required this.movie,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            movie.posterPath == null
                ? const DefaultPosterWidget()
                : PosterWidget(
                    posterPath: movie.posterPath!,
                  ),
            _movieVote(),
            _movieName(),
          ],
        ),
      ),
    );
  }

  Widget _movieName() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                movie.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _movieVote() {
    return Positioned(
      top: 3,
      right: 4,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(movie.voteAverage!.toStringAsFixed(1)),
      ),
    );
  }
}
