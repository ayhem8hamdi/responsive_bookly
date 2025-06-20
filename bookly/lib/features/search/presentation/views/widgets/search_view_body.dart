import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/views/widgets/instagram_like_search_bar.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [InstagramLikeSearchBar()],
    );
  }
}

class SearchedBookList extends StatelessWidget {
  const SearchedBookList({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) =>
                BestSellerItem(volumeInfo: volumeInfo)));
  }
}
