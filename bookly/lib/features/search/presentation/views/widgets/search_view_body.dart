import 'package:bookly/features/home/presentation/views/widgets/gap.dart';
import 'package:bookly/features/search/presentation/views/widgets/instagram_like_search_bar.dart';
import 'package:bookly/features/search/presentation/views/widgets/searched_books_result.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        Gap(33),
        SliverToBoxAdapter(child: InstagramLikeSearchBar()),
        Gap(29),
        SearchedBooksResult()
      ],
    );
  }
}
