import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_item_list.dart';

class FeaturedBooksHorizList extends StatelessWidget {
  const FeaturedBooksHorizList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksFailed) {
          UIErrorHandler.showError(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28 < 150
                      ? 150
                      : MediaQuery.of(context).size.height * 0.28,
                  child: const BookItemListShimmer()));
        } else if (state is FeaturedBooksSucces) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.28 < 150
                  ? 150
                  : MediaQuery.of(context).size.height * 0.28,
              child: BookItemList(
                items: state.books,
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: Text('No Data')));
        }
      },
    );
  }
}

class BookItemListShimmer extends StatelessWidget {
  const BookItemListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(width: 15),
      itemBuilder: (_, __) => AspectRatio(
        aspectRatio: 150 / 224,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const BookImageLoader()),
      ),
    );
  }
}
