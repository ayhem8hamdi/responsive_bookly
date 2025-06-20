import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookItemList extends StatelessWidget {
  const BookItemList({super.key, required this.items});
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<SearchCubitCubit>().fetchSearchedBooks(
                bookName: items[index].volumeInfo!.title ?? '');
            Get.toNamed(AppRouter.bookDetailsScreen,
                arguments: items[index].volumeInfo!);
          },
          child: BookItem(
            volumeInfo: items[index].volumeInfo!,
          ),
        );
      },
    );
  }
}
