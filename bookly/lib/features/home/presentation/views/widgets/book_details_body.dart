import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_bottom_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_upper_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/pricing_row.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final VolumeInfo book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BookDetailsAppBar(),
        const BookDetailsImage(),
        BookDetailsUpperSection(book: book),
        const PricingRow(),
        const BookDetailsBottomSection()
      ],
    );
  }
}
