import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';

class InstagramLikeSearchBar extends StatefulWidget {
  const InstagramLikeSearchBar({super.key});

  @override
  InstagramLikeSearchBarState createState() => InstagramLikeSearchBarState();
}

class InstagramLikeSearchBarState extends State<InstagramLikeSearchBar> {
  bool isSearching = false;
  late FocusNode focusNode;
  late TextEditingController controller;

  Timer? _debounce;

  static const Duration debounceDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();

    controller.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(debounceDuration, () {
      final query = controller.text.trim();
      if (query.isNotEmpty) {
        context.read<SearchCubitCubit>().fetchSearchedBooks(bookName: query);
      } else {
        context.read<SearchCubitCubit>().clearSearch();
      }
    });
  }

  void startSearch() {
    setState(() {
      isSearching = true;
    });
    focusNode.requestFocus();
  }

  void stopSearch() {
    controller.clear();
    context.read<SearchCubitCubit>().clearSearch();
    setState(() {
      isSearching = false;
    });
    focusNode.unfocus();

    Navigator.pop(
        context); // This makes the back arrow go back to previous screen
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.removeListener(_onSearchTextChanged);
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSearching)
          FadeInLeft(
            duration: const Duration(milliseconds: 200),
            child: IconButton(
              color: Colors.white,
              icon: const Padding(
                padding: EdgeInsets.only(left: 9),
                child: Icon(Icons.arrow_back),
              ),
              onPressed: stopSearch,
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: GestureDetector(
              onTap: startSearch,
              child: FadeInRight(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  alignment: Alignment.centerLeft,
                  child: isSearching
                      ? TextField(
                          focusNode: focusNode,
                          controller: controller,
                          decoration: InputDecoration(
                            suffixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(Icons.search),
                            ),
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              Text('  Search',
                                  style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
