import 'package:flutter/material.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/res/app_color.dart';

class GenreCardWidget extends StatelessWidget {
  final Genre genre;
  const GenreCardWidget({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Text(genre.name),
    );
  }
}
