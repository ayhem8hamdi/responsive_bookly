import 'dart:developer';

import 'package:bookly/core/utils/app_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 45),
          child: CustomAppBar(),
        ),
        BookItem(image: Assets.book1)
      ],
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AspectRatio(
        aspectRatio: 150 / 244,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover))),
      ),
    );
  }
}
