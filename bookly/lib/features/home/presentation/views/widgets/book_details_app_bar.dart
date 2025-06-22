import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_scroll_view_app_bar.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;
  @override
  Widget build(BuildContext context) {
    return CustomScrollViewAppBar(
      leftAsset: Assets.sortirIcon,
      rightAsset: Assets.cartIcon,
      onPressed: () {
        context.read<SearchCubitCubit>().fetchYouMayLikeBooks(
              selectedBook: volumeInfo,
            );
        if (Navigator.canPop(context)) {
          Get.back();
        }
      },
    );
  }
}
