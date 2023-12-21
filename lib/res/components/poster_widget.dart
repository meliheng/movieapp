import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  final double height;
  final double width;
  final String posterPath;
  const PosterWidget({
    super.key,
    required this.height,
    required this.width,
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
    // return Container(
    //   width: width,
    //   decoration: BoxDecoration(
    //     color: Colors.red,
    //     borderRadius: BorderRadius.circular(30),
    //     image: DecorationImage(
    //       filterQuality: FilterQuality.low,
    //       fit: BoxFit.contain,
    //       image: NetworkImage("$url$posterPath"),
    //     ),
    //   ),
    // );
  }
}
