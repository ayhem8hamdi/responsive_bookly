import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = Get.arguments as VolumeInfo;
    return SafeArea(
      child: Scaffold(
        body: BookDetailsBody(book: book),
      ),
    );
  }
}
