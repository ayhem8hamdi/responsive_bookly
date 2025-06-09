import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CustomScrollViewAppBar extends StatelessWidget {
  const CustomScrollViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 45),
        child: CustomAppBar(),
      ),
    );
  }
}
