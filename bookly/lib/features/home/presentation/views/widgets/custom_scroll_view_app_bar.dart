import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CustomScrollViewAppBar extends StatelessWidget {
  const CustomScrollViewAppBar({
    super.key,
    required this.leftAsset,
    required this.rightAsset,
    required this.onPressed,
  });

  final String leftAsset;
  final String rightAsset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 45),
        child: CustomAppBar(
          onPressed: onPressed,
          leftAsset: leftAsset,
          rightAsset: rightAsset,
        ),
      ),
    );
  }
}
