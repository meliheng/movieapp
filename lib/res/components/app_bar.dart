import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movieapp/res/app_string.dart';
import 'package:movieapp/res/components/searchbar_widget.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final bool showSearchBar;
  final String? title;
  CustomAppBar({
    super.key,
    required this.appBar,
    this.showSearchBar = true,
    this.title,
  });

  final searchBarProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(searchBarProvider) && showSearchBar;
    return AppBar(
      title: show ? const SearchBarWidget() : Text(title ?? AppString.appTitle),
      actions: [
        if (showSearchBar)
          AppBarActions(
            searchBarProvider: searchBarProvider,
            ref: ref,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.searchBarProvider,
    required this.ref,
  });

  final StateProvider<bool> searchBarProvider;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(searchBarProvider)) {
      return IconButton(
        icon: const Icon(Icons.close_rounded),
        onPressed: () {
          ref.read(searchBarProvider.notifier).state = false;
        },
      );
    }
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        ref.read(searchBarProvider.notifier).state = true;
      },
    );
  }
}
