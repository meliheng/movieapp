import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/res/app_color.dart';
import 'package:movieapp/view_model/movie_list_view_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SizedBox(
          height: 40,
          child: TextField(
            controller: searchController,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {
              ref
                  .watch(movieListViewModelProvider.notifier)
                  .getMoviesByQuery(value);
            },
            cursorColor: AppColors.whiteColor,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    searchController.clear();
                  });
                  ref
                      .watch(movieListViewModelProvider.notifier)
                      .clearFilterText();
                },
                child: const Icon(
                  Icons.close_sharp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
