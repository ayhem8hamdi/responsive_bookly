import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_best_seller_rating_line.dart';
import 'package:flutter/material.dart';

class BookDetailsUpperSection extends StatelessWidget {
  const BookDetailsUpperSection({
    super.key,
    required this.book,
  });
  final VolumeInfo book;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              book.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular30,
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            book.authors![0],
            style: AppStyles.styleRegular18,
          ),
          const SizedBox(
            height: 12,
          ),
          RateSection(
            volumeInfo: book,
          )
        ],
      ),
    );
  }
}
