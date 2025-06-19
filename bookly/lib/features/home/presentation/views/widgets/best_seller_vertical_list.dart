import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerVerticalList extends StatelessWidget {
  const BestSellerVerticalList({super.key, required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return BestSellerItem(
            volumeInfo: items[index].volumeInfo!,
          );
        },
        childCount: items.length,
      ),
    );
  }
}
