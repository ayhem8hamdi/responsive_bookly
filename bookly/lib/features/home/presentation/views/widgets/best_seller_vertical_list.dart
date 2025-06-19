import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/view_model/best_seller_cubit/cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerVerticalList extends StatelessWidget {
  const BestSellerVerticalList({super.key, required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return BestSellerItem(
            volumeInfo: items[index].volumeInfo!,
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerCubit, BestSellerState>(
      listener: (context, state) {
        if (state is BestSellerFailed) {
          UIErrorHandler.showError(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is BestSellerLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is BestSellerSucces) {
          return BestSellerVerticalList(
            items: state.books,
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: Text('No Data')));
        }
      },
    );
  }
}
