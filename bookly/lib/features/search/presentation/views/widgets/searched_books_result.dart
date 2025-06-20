import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/no_result_widget.dart';
import 'package:bookly/features/search/presentation/views/widgets/searched_books_list.dart';
import 'package:bookly/features/search/presentation/views/widgets/searched_books_schimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedBooksResult extends StatelessWidget {
  const SearchedBooksResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubitCubit, SearchCubitState>(
      listener: (context, state) {
        if (state is SearchCubitFailure) {
          UIErrorHandler.showError(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is SearchCubitLoading) {
          return const SearchedBooksShimmerSliverList();
        } else if (state is SearchCubitSucces) {
          final books = state.books
              .map((item) => item.volumeInfo)
              .whereType<VolumeInfo>()
              .toList();

          if (books.isEmpty) {
            return const NoResultsFoundSliver();
          }

          return SearchedBookSliverList(volumeInfo: books);
        } else if (state is SearchCubitFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'Error occurred: ${state.failure.message}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
