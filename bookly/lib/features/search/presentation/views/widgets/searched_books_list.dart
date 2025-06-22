import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchedBookSliverList extends StatelessWidget {
  const SearchedBookSliverList({super.key, required this.volumeInfo});
  final List<VolumeInfo> volumeInfo;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
            onTap: () {
              context.read<SearchCubitCubit>().fetchYouMayLikeBooks(
                    selectedBook: volumeInfo[index],
                  );
              Get.toNamed(AppRouter.bookDetailsScreen,
                  arguments: volumeInfo[index]);
            },
            child: BestSellerItem(volumeInfo: volumeInfo[index])),
        childCount: volumeInfo.length,
      ),
    );
  }
}
