import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(
    this.height, {
    super.key,
  });
  final int height;
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 25,
      ),
    );
  }
}
