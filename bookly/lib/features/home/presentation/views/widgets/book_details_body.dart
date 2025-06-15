import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_scroll_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomScrollViewAppBar(
          leftAsset: Assets.sortirIcon,
          rightAsset: Assets.cartIcon,
          onPressed: () {
            if (Navigator.canPop(context)) {
              Get.back();
            }
          },
        ),
      ],
    );
  }
}
