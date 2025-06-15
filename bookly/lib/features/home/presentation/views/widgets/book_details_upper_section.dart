import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_best_seller_rating_line.dart';
import 'package:flutter/material.dart';

class BookDetailsUpperSection extends StatelessWidget {
  const BookDetailsUpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 28,
          ),
          Text(
            'The Jungle Book',
            style: AppStyles.styleRegular30,
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Rudyard Kipling',
            style: AppStyles.styleRegular18,
          ),
          const SizedBox(
            height: 12,
          ),
          const RateSection()
        ],
      ),
    );
  }
}
