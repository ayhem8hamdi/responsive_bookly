import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
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
          child: Text(
            'Best Seller',
            style: AppStyles.styleRegular18,
          ),
        ),
        const Gap(18)
      ],
    );
  }

  SliverToBoxAdapter customScrollViewHorizontalBookList(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28 < 150
            ? 150
            : MediaQuery.of(context).size.height * 0.28,
        child: const BookItemList(),
      ),
    );
  }
}

class CustomScrollViewAppBar extends StatelessWidget {
  const CustomScrollViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 45),
        child: CustomAppBar(),
      ),
    );
  }
}
