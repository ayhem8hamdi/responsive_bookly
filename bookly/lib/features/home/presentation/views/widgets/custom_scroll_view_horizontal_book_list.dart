import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedBooksHorizList extends StatelessWidget {
  const FeaturedBooksHorizList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28 < 150
            ? 150
            : MediaQuery.of(context).size.height * 0.28,
        child: GestureDetector(
            onTap: () => Get.toNamed(AppRouter.bookDetailsScreen),
            child: const BookItemList()),
      ),
    );
  }
}
