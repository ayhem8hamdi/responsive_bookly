import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final book = Get.arguments as VolumeInfo;
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35 < 160
                ? 160
                : MediaQuery.of(context).size.height * 0.35,
            child: BookItem(
              volumeInfo: book,
            )),
      ),
    );
  }
}
