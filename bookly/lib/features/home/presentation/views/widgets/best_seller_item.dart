import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_best_seller_rating_line.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .184,
                child: const BookItem(image: Assets.book1),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Harry Potter and the Goblet of Fire',
                    style: AppStyles.styleRegular20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'J.K. Rowling',
                    style: AppStyles.styleRegular14,
                  ),
                  const SizedBox(height: 8),
                  const CustomBestSellerRatingLine()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
