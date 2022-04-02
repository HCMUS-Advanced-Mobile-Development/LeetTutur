import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatefulWidget {
  final void Function()? onFilterTapped;
  final Function(String)? onQueryChanged;
  final Function(String)? onSubmitted;

  const SearchBar({Key? key, this.onFilterTapped, this.onQueryChanged, this.onSubmitted}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final FloatingSearchBarController controller;

  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: S.current.search,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      controller: controller,
      onQueryChanged: widget.onQueryChanged,
      onSubmitted: (query) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(query);
        }

        controller.close();
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              if (widget.onFilterTapped != null) {
                widget.onFilterTapped!();
              }
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return const SizedBox.shrink();
        // return ClipRRect(
        //   borderRadius: BorderRadius.circular(8),
        //   child: Material(
        //     color: Colors.white,
        //     elevation: 4.0,
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: Colors.accents.map((color) {
        //         return Container(height: 112, color: color);
        //       }).toList(),
        //     ),
        //   ),
        // );
      },
    );
  }
}
