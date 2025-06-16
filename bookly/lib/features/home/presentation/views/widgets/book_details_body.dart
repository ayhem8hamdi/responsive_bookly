import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_upper_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
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

class BookDetailsBottomSection extends StatelessWidget {
  const BookDetailsBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text('You can also like',
              style: AppStyles.styleRegular14.copyWith(color: Colors.white)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20 < 115
              ? 105
              : MediaQuery.of(context).size.height * 0.20,
          child: const BookItemList(),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
