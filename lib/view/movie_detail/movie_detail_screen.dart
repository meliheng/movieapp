import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/models/movie_response.dart';
import 'package:movieapp/res/app_size.dart';
import 'package:movieapp/res/app_string.dart';
import 'package:movieapp/res/app_url.dart';
import 'package:movieapp/res/components/app_bar.dart';
import 'package:movieapp/res/components/genre_card_widget.dart';
import 'package:movieapp/view/movie_list/movie_item.dart';
import 'package:movieapp/view_model/movie_detail_view_model.dart';

final getDetailProvider = FutureProvider.family<List<Genre>, Movie>(
  (ref, arg) async {
    return ref.read(movieDetailViewModel).getGenres(arg);
  },
);

class MovieDetailScreen extends ConsumerWidget {
  final Movie movie;
  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(getDetailProvider(movie));
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: movie.title,
        showSearchBar: false,
      ),
      body: Column(
        children: [
          _movieImageCard(context),
          _movieContent(provider),
        ],
      ),
    );
  }

  Widget _movieContent(AsyncValue<List<Genre>> movieDetailViewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.details),
          Text(
            movie.overview!,
            style: const TextStyle(height: 1.5),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(AppString.type),
          const SizedBox(height: 10),
          movieDetailViewModel.when(
            data: (data) {
              return Wrap(
                runSpacing: 5,
                spacing: 5,
                children: data
                    .map(
                      (e) => GenreCardWidget(genre: e),
                    )
                    .toList(),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget _movieImageCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.height(context) * .3,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${AppUrl.imageUrl}${movie.backdropPath}',
              ),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .3,
            child: MovieItem(
              movie: movie,
              width: MediaQuery.sizeOf(context).width / 2,
              height: AppSize.height(context) * .2,
            ),
          ),
        )
      ],
    );
  }
}
