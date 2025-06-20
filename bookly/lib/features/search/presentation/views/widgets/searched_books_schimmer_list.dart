import 'package:bookly/features/home/presentation/views/widgets/best_seller_item_shimmer.dart';
import 'package:flutter/material.dart';

class SearchedBooksShimmerSliverList extends StatelessWidget {
  const SearchedBooksShimmerSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const BestSellerItemShimmer(),
        childCount: 15,
      ),
    );
  }
}
