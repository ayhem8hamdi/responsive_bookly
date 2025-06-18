import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
import 'package:flutter/material.dart';

class BookDetailsBottomSection extends StatelessWidget {
  const BookDetailsBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BottomSectionTitle(),
        SizedBox(
          height: 20,
        ),
        BottomSectionListViewHoriz(),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

class BottomSectionTitle extends StatelessWidget {
  const BottomSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text('You can also like',
          style: AppStyles.styleRegular14.copyWith(color: Colors.white)),
    );
  }
}

class BottomSectionListViewHoriz extends StatelessWidget {
  const BottomSectionListViewHoriz({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20 < 115
          ? 105
          : MediaQuery.of(context).size.height * 0.20,
      child: const BookItemList(
        items: [],
      ),
    );
  }
}
