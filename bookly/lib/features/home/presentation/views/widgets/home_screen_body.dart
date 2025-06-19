import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_title.dart';
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
        CustomScrollViewAppBar(
          leftAsset: Assets.logo,
          rightAsset: Assets.searchIcon,
          onPressed: () {},
        ),
        const FeaturedBooksHorizList(),
        const Gap(25),
        const BestSellerTitle(),
        const Gap(18),
        const BestSellerList(),
      ],
    );
  }
}
