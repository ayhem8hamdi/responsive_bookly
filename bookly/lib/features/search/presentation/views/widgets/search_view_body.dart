import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/instagram_like_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InstagramLikeSearchBar(),
        Expanded(
          child: BlocConsumer<SearchCubitCubit, SearchCubitState>(
            listener: (context, state) {
              if (state is SearchCubitFailure) {
                UIErrorHandler.showError(context, state.failure);
              }
            },
            builder: (context, state) {
              if (state is SearchCubitLoading) {
                return const Center(child: CircularProgressIndicator());
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
        ),
      ],
    );
  }
}

class SearchedBookList extends StatelessWidget {
  const SearchedBookList({super.key, required this.volumeInfo});
  final List<VolumeInfo> volumeInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: volumeInfo.length,
      itemBuilder: (context, index) =>
          BestSellerItem(volumeInfo: volumeInfo[index]),
    );
  }
}
