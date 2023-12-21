import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie_list_state.dart';
import 'package:movieapp/utils/_utils_exporter.dart';
import 'package:movieapp/view/movie_list/movie_item.dart';
import 'package:movieapp/view_model/movie_list_view_model.dart';

class MovieListView extends ConsumerWidget {
  MovieListView({
    super.key,
  });

  final ScrollController scrollController = ScrollController();
  void createScrollController(WidgetRef ref) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          ref
              .watch(movieListViewModelProvider.notifier)
              .loadMoreMovies(scrollController);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(movieListViewModelProvider);
    createScrollController(ref);
    switch (response.fetchEnum) {
      case PageStatus.newPageLoaded:
      case PageStatus.firstPageLoaded:
        return _movieGridView(response);
      case PageStatus.firstPageLoading:
        return _firstPageLoadingWidget();
      case PageStatus.firstPageError:
      case PageStatus.newPageError:
        return Text(response.errorMessage);
      case PageStatus.newPageLoading:
        return _newPageLoadingWidget(response);
      default:
    }
    return Container();
  }

  Widget _newPageLoadingWidget(MovieListState response) {
    return Stack(
      children: [
        _movieGridView(response),
        _horizontalProgressIndicator(),
      ],
    );
  }

  Widget _firstPageLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _horizontalProgressIndicator() {
    return const Positioned(
      bottom: 5,
      left: 5,
      right: 5,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: LinearProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _movieGridView(MovieListState response) {
    if (scrollController.hasClients == true) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    return PageStorage(
      key: pageStorageKey,
      bucket: pageStorageBucket,
      child: GridView.builder(
        controller: scrollController,
        physics: const ScrollPhysics(),
        itemCount: response.filteredMovies.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: MovieItem(
                  movie: response.filteredMovies[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.detail,
                      arguments: response.filteredMovies[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
