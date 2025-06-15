import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.30 < 150
              ? 150
              : MediaQuery.of(context).size.height * 0.30,
          child: const BookItem(
            image: Assets.book1,
          ),
        ),
      ),
    );
  }
}
