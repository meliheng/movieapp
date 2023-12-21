import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  final String posterPath;
  const PosterWidget({
    super.key,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    const url = "https://image.tmdb.org/t/p/w500";
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "$url$posterPath",
      ),
    );
  }
}
