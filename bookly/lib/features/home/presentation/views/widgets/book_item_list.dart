import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookItemList extends StatelessWidget {
  const BookItemList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Assets.book1,
      Assets.book2,
      Assets.book3,
      Assets.book4,
      Assets.book5
    ];
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return BookItem(
          image: images[index],
        );
      },
    );
  }
}
