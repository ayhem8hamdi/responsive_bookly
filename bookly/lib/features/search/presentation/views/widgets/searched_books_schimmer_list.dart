import 'package:bookly/features/home/presentation/views/widgets/best_seller_item_shimmer.dart';
import 'package:flutter/material.dart';

class SearchedBooksSchimmerList extends StatelessWidget {
  const SearchedBooksSchimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const BestSellerItemShimmer(),
      itemCount: 15,
    );
  }
}
