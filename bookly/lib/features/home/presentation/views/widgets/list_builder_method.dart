import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/view_model/best_seller_cubit/cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

SliverList bestSellerSliverList(BestSellerSucces state) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<SearchCubitCubit>().fetchYouMayLikeBooks(
                  selectedBook: state.books[index].volumeInfo!,
                );

            Get.toNamed(
              AppRouter.bookDetailsScreen,
              arguments: state.books[index].volumeInfo!,
              preventDuplicates: false,
            );
          },
          child: BestSellerItem(
            volumeInfo: state.books[index].volumeInfo!,
          ),
        );
      },
      childCount: state.books.length,
    ),
  );
}
