import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_bottom_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_upper_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/pricing_row.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BookDetailsAppBar(),
        BookDetailsImage(),
        BookDetailsUpperSection(),
        PricingRow(),
        BookDetailsBottomSection()
      ],
    );
  }
}
