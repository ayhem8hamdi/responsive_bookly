import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else if (state is FeaturedBooksSucces) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.28 < 150
                  ? 150
                  : MediaQuery.of(context).size.height * 0.28,
              child: GestureDetector(
                  onTap: () => Get.toNamed(AppRouter.bookDetailsScreen),
                  child: BookItemList(
                    items: state.books,
                  )),
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
