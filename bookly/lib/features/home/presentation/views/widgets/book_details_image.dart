import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({
    super.key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35 < 160
                ? 160
                : MediaQuery.of(context).size.height * 0.35,
            child: BookItem(
              item: item,
            )),
      ),
    );
  }
}
