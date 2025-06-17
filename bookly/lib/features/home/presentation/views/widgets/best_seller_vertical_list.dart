import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerVerticalList extends StatelessWidget {
  const BestSellerVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const BestSellerItem();
        },
        childCount: 10,
      ),
    );
  }
}
