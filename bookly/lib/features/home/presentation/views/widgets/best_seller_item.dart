import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_best_seller_rating_line.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .184,
              child: BookItem(
                item: item,
              ),
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
                  item.volumeInfo!.title ?? 'no title found',
                  style: AppStyles.styleRegular20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  item.volumeInfo!.authors?[0] ?? 'no data found',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleRegular14,
                ),
                const SizedBox(height: 8),
                CustomBestSellerRatingLine(volumeInfo: item.volumeInfo!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
