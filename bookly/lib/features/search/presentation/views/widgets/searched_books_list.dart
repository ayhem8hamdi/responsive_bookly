import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchedBookSliverList extends StatelessWidget {
  const SearchedBookSliverList({super.key, required this.items});
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
            onTap: () {
              context.read<SearchCubitCubit>().fetchYouMayLikeBooks(
                    selectedBook: items[index].volumeInfo!,
                  );
              Get.toNamed(AppRouter.bookDetailsScreen, arguments: items[index]);
            },
            child: BestSellerItem(item: items[index])),
        childCount: items.length,
      ),
    );
  }
}
