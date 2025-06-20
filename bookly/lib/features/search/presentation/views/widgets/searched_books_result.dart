import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/searched_books_list.dart';
import 'package:bookly/features/search/presentation/views/widgets/searched_books_schimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedBooksResult extends StatelessWidget {
  const SearchedBooksResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<SearchCubitCubit, SearchCubitState>(
        listener: (context, state) {
          if (state is SearchCubitFailure) {
            UIErrorHandler.showError(context, state.failure);
          }
        },
        builder: (context, state) {
          if (state is SearchCubitLoading) {
            return const SearchedBooksSchimmerList();
          } else if (state is SearchCubitSucces) {
            final books = state.books
                .map((item) => item.volumeInfo)
                .whereType<VolumeInfo>()
                .toList();

            if (books.isEmpty) {
              return const Center(child: Text('No books found'));
            }

            return SearchedBookList(volumeInfo: books);
          } else if (state is SearchCubitFailure) {
            return Center(
                child: Text('Error occurred: ${state.failure.message}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
