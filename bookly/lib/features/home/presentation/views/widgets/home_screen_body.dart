import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_scroll_view_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_scroll_view_horizontal_book_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/gap.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomScrollViewAppBar(),
        customScrollViewHorizontalBookList(context),
        const Gap(25),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Best Seller',
              style: AppStyles.styleRegular18,
            ),
          ),
        ),
        const Gap(18),
        const BestSellerItem()
      ],
    );
  }
}
