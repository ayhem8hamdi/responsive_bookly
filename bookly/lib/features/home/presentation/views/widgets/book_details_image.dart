import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({
    super.key,
    required this.book,
  });
  final VolumeInfo book;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35 < 160
                ? 160
                : MediaQuery.of(context).size.height * 0.35,
            child: BookItem(
              volumeInfo: book,
            )),
      ),
    );
  }
}
